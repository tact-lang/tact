contract X {
    // Function that returns the initial state of contract Y
    fun getYInit() : StateInit {
        return initOf Y();
    }
    receive() {}
}

contract Y {
    // Function that returns the initial state of contract X
    fun getXInit() : StateInit {
        return initOf X();
    }
    receive() {}
}
