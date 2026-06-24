contract Foo {
    // No state variables and no init, so uses implicit empty init()
    receive() {}
}

contract Test {
    receive() {
        let initPkg = initOf Foo();
        let codeCell = codeOf Foo;  
    }
}
