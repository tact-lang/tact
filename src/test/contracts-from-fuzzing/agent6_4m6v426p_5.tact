struct Tree {
    left: StateInit;
    right: StateInit;
}

contract D {
    init(x: Int) {}
}

contract C {
    init() {}
    fun getD(): StateInit {
       return initOf D(7,);
    }
}

contract B {
    init(y: Int) {}
    fun getC(): StateInit {
       return initOf C();
    }
}

contract A {
    init(z: Int) {}
    fun getTree(): Tree {
       return Tree{
           left: initOf B(42,),
           right: initOf C()
       };
    }
}
