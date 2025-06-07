struct OptionalPacked {
    o1: Int? as uint8;
    o2: Int? as uint8;
    o3: Int? as uint8;
}

contract TestContract {
    optComp: OptionalPacked;
    init() {
        self.optComp = OptionalPacked{ o1:null, o2:null, o3:null };
    }
    receive() {
        self.optComp = OptionalPacked{ o1:1, o2:2, o3:3 };
    }
}