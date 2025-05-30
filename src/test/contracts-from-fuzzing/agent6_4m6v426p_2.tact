contract B {
    x: Int;
    init(x: Int) {
        self.x = x;
    }
}

contract A {
    fun createB(): StateInit {
        return initOf B(123,);
    }
}
