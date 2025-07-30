contract SimpleContract {
    init() {}
}

contract TestInit {
    fun getInit() : StateInit {
        return initOf SimpleContract();
    }
}
