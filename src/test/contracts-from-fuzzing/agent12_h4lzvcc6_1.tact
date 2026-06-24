contract B {
    init(a: Int) {}
}

contract A {
    fun getBInit(a: Int) : StateInit {
         return initOf B(a);
    }
    receive() {}
}
