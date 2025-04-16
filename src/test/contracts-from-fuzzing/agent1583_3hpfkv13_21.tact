struct Reordered {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
}

contract FieldOrder {
    data: Reordered;

    init() {
        self.data = Reordered{ a:1, b:true, c:"x", d:emptyCell().asSlice(), e:myAddress() };
    }
}