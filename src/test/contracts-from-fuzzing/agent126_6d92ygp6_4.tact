contract A {
    receive() {}
}

contract Test {
    fun test() {
        let pkg: StateInit = initOf A();
    }
    
    receive() {
        self.test();
    }
}
