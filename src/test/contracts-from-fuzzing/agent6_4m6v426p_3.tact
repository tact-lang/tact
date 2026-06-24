contract C {
    init() {}
}

contract B {
    init(c: StateInit) {}
    fun getCInit(): StateInit {
       return initOf C();
    }
}

contract A {
    init(b: StateInit) {}
    fun getBInit(): StateInit {
       return initOf B(initOf C());
    }
}
