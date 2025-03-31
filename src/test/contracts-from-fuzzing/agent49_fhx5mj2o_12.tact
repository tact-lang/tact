contract A {
    receive() {}
}

contract TestDirectUsage {
    receive() {
         // Direct usage of initOf and codeOf expressions without assignment
         initOf A();
         codeOf A;
    }
}
