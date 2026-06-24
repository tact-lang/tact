contract C {
    init() {}
    receive() {}
}

contract B {
    init(x: Int) {}
    fun getCInit(): StateInit {
       return initOf C();
    }
    receive() {}
}

contract A {
    init(y: Int) {}
    fun getBInit(y: Int): StateInit {
        return initOf B(y);
    }
    receive() {}
}

contract Rec {
    fun getMyInit(): StateInit {
         return initOf Rec();
    }
    receive() {}
}

contract X {
    init(a: Int, b: Int) {}
    receive() {}
}

contract Test {
    fun getXInit(): StateInit {
         return initOf X(10, 20,);
    }
    receive() {}
}

contract Z {
    init(addr: Address) {}
    receive() {}
}

contract Y {
    fun getZAddr(): Address {
         return contractAddress(initOf Z(myAddress()));
    }
    receive() {}
}
