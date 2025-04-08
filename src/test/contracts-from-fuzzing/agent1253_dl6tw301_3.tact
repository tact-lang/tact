struct Sub {
    val: Int;
}

contract OptNested {
    nestedOpt: Sub?;

    init() {
        self.nestedOpt = null;
    }
    
    receive() {
        // later usage
    }
}