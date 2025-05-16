struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
}

contract MixedFields {
    combo: Combo;

    init() {
        self.combo = Combo{ a:1, b:true, c:"hi", d:emptyCell().asSlice() };
    }
}