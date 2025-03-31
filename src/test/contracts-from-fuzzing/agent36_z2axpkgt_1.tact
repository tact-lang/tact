contract Child {
    init(x: Int) {
        // simple initializer
    }
}

contract Parent {
    // Function returning the initial StateInit of Child contract
    fun getChildState(x: Int): StateInit {
        return initOf Child(x);
    }
    
    // minimal receive function
    receive() {}
}
