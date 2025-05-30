contract A {
    init() {}
    receive() {}
}

contract B {
    fun getAInit() : StateInit {
        return initOf A();
    }
    receive() {}
}

contract C {
    fun getBInit() : StateInit {
        return initOf B();
    }
    receive() {}
}
