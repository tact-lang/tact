contract A {
    init() { }
}

contract Test {
    receive() {
         let pkg: StateInit = initOf A( );
    }
}
