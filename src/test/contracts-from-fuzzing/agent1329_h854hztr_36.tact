struct StructWithBoolInt {
    b: Bool;
    i: Int as uint4;
}

contract SmallSerialized {
    s: StructWithBoolInt;

    init() {
        self.s = StructWithBoolInt{ b:true, i:7 };
    }
}