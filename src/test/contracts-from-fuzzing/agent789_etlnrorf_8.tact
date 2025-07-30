struct HasString {
    s: String;
}

struct HasSlice {
    slice: Slice;
}

struct Combo {
    a: HasString;
    b: HasSlice;
    c: Int;
    d: Bool?;
}

contract MixedTypesTest {
    m: Combo;
    init() {
        self.m = Combo{
            a: HasString{s: "hi"},
            b: HasSlice{slice: emptyCell().asSlice()},
            c: 100,
            d: null
        };
    }
}