contract A2 {
    fun initB() : StateInit {
        return initOf B2();
    }
}

contract B2 {
    fun initA() : StateInit {
        return initOf A2();
    }
}
