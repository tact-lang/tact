// Large struct with many diverse primitive fields, no nesting
struct LargeFlat {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
}

contract ManyFields {
    lv: LargeFlat = LargeFlat{
        i1: 1, i2: 2, b1: true, b2: null, s1: "x", s2: null
    };

    receive() {}
}