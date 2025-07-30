struct DepInit {
    child: StateInit;
    grand: StateInit;
}

contract GrandChild {
    init(y: Int) { }
}

contract Child {
    fun getGrandChildInit() : StateInit {
         return initOf GrandChild(456);
    }
}

contract Parent {
    fun getDependencies() : DepInit {
         return DepInit{ child: initOf Child(), grand: initOf GrandChild(789) };
    }
}
