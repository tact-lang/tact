struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: Slice;
}

contract MultipleStructFields {
    one: S1;
    two: S2;

    init() {
        self.one = S1{ a:1, b:true };
        self.two = S2{ c:"hi", d:emptyCell().asSlice() };
    }
}