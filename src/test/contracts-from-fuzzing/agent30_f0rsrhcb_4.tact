contract R {
    fun recInit(): StateInit {
         return initOf R();
    }
}

contract X {
    fun initY(): StateInit {
         return initOf Y();
    }
}

contract Y {
    fun initX(): StateInit {
         return initOf X();
    }
}

contract Nest3 {
    init() {}
}

contract Nest2 {
    fun getNest3(): StateInit { 
        return initOf Nest3(); 
    }
}

contract Nest1 {
    fun getNest2(): StateInit { 
        return initOf Nest2(); 
    }
}

contract RecvTest {
    receive("test") {
       let s = initOf RecvTest();
    }
}

contract U {
    init() {}
}

contract V {
    init() {}
}

contract MultiInit {
    fun getBoth(): Int {
         let a = initOf U();
         let b = initOf V();
         return 1;
    }
}
