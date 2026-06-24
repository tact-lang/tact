struct Sub {
    val: Int;
}

contract OptNested {
    nestedOpt: Sub?;

    init() {
        self.nestedOpt = Sub{ val: 123 };
    }
    
    receive() {
        // do nothing
    }
}