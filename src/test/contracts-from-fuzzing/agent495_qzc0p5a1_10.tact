struct Combo1 {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Combo2 {
    d: Bool;
    e: Int;
    f: Bool?;
}

struct ComboWrap {
    one: Combo1;
    two: Combo2;
}

contract ComboFieldsTest {
    combined: ComboWrap;
    init() {
        self.combined = ComboWrap{
            one: Combo1{ a: 1, b: true, c: null },
            two: Combo2{ d: false, e: 2, f: null }
        };
    }
}