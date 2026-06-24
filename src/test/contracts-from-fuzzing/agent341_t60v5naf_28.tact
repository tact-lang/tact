struct NestedBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract BoolPacking {
    data: NestedBools;

    init() {
        self.data = NestedBools{ b1:true, b2:false, b3:true, b4:true };
    }
}