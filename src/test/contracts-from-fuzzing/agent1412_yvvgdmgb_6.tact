struct Nested {
    val: Int as int8;
    flag: Bool;
}

struct ComboStruct {
    a: Int;
    b: Bool;
    c: Int as uint4;
    d: String?;
    e: Nested;
    f: Nested?;
}

contract MixedSerialization {
    data: ComboStruct;

    init() {
        self.data = ComboStruct{
            a: 42,
            b: true,
            c: 7,
            d: null,
            e: Nested{ val: -5, flag: false },
            f: null,
        };
    }
}