struct Pair {
    left: StateInit;
    right: StateInit;
}

contract X {
    init() {}
    fun getYInit(): StateInit {
         return initOf Y();
    }
}

contract Y {
    init() {}
    fun getXInit(): StateInit {
         return initOf X();
    }
}

contract Main {
    init() {}
    fun testCycle(): Pair {
         return Pair{
             left: initOf X(),
             right: initOf Y()
         };
    }
}
