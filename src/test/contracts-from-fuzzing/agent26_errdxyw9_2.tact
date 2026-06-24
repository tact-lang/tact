contract Child {
    init(x: Int) { }
}

contract Parent {
    fun getChildInit() : StateInit {
        return initOf Child(123);
    }
}
