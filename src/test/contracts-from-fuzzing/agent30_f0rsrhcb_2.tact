contract A {
    init() {}
}

contract B {
    fun getAInit(): StateInit {
        return initOf A();
    }
}

contract C {
    fun getBInit(): StateInit {
        return initOf B();
    }
}
