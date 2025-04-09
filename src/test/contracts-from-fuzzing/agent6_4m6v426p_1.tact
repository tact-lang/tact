contract B {
    init() {}
}

contract A {
    fun createB(): StateInit {
        return initOf B();
    }
}
