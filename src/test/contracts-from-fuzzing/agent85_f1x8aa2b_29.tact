struct NestedOptInt {
    val: Int?;
}

contract DeepOptionalStruct {
    f: NestedOptInt;
    
    init() {
        self.f = NestedOptInt{ val: null };
    }

    receive() {}
}