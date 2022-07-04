#!/bin/bash

[ -d build ] || mkdir build

c () {
  gcc -O1 -o build/pi_c src/pi.c
  [ $? == 0 ] && echo "C compilled successfully"
}

cpp () {
  g++ -O1 -o build/pi_cpp src/pi.cpp
  [ $? == 0 ] && echo "C++ compilled successfully"
}

cs () {
  ([[ $OS == "Windows_NT" ]] && csc /out:build/pi_cs src\\pi.cs) || mcs -out:build/pi_cs src/pi.cs
  [ $? == 0 ] && echo "C-sharp compilled successfully"
}

f90 () {
  gfortran -O1 -o build/pi_f90 src/pi.f90
  [ $? == 0 ] && echo "Fortran compilled successfully"
}

golang () {
  go build -o build/pi_go src/pi.go
  [ $? == 0 ] && echo "Go compilled successfully"
}

java_comp () {
  javac -d build src/Pi.java
  if [ $? == 0 ]; then
  cd build
  jar -cfe pi_java.jar Pi *.class
  [ $? == 0 ] && echo "Java compilled successfully"
  rm *.class
  cd ..
  fi
}

kt () {
  kotlinc src/pi.kt -include-runtime -d build/pi_kt.jar
  [ $? == 0 ] && echo "Kotlin compiled successfully"
}

pp () {
  fpc -Px86_64 -O2 -FE"build" -o"pi_pp" src/pi.pp
  [ $? == 0 ] && echo "Pascal compilled successfully"
  cd build
  rm *.o
  cd ..
}

rs () {
  rustc -o build/pi_rs -O src/pi.rs
  [ $? == 0 ] && echo "Rust compilled successfully"
}

vb () {
  ([[ $OS == "Windows_NT" ]] && vbc /out:build/pi_vb src\\pi.vb) || vbnc /out:build/pi_vb src/pi.vb
  [ $? == 0 ] && echo "Visual Basic .NET compiled successfully"
}

case $1 in
  "--c")
    c;;
  "--cpp")
    cpp;;
  "--cs")
    cs;;
  "--f90")
    f90;;
  "--go")
    golang;;
  "--java")
    java_comp;;
  "--kt")
    kt;;
  "--pp")
    pp;;
  "--rs")
    rs;;
  "--vb")
    vb;;
  "--all")
    c
    cpp
    cs
    f90
    golang
    java_comp
    kt
    pp
    rs
    vb;;
  *)
    echo "Options:"
    echo " "
    echo "  --c     Compile C"
    echo "  --cpp   Compile C++"
    echo "  --cs    Compile C-sharp"
    echo "  --f90   Compile Fortran"
    echo "  --go    Compile Go"
    echo "  --java  Compile Java"
    echo "  --kt    Compile Kotlin"
    echo "  --pp    Compile Pascal"
    echo "  --rs    Compile Rust"
    echo "  --vb    Compile Visual Basic"
    echo "  --all   Compile all languages"
esac
