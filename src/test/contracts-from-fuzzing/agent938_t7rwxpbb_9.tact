struct MixStruct {
    anInt: Int;
    aBool: Bool;
    aStr: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    nested: Nested;
}

struct Nested {
    val: Int;
    optVal: Int?;
}

contract MixStructContract {
    data: MixStruct;

    init() {
        self.data = MixStruct{
            anInt: 17,
            aBool: true,
            aStr: "hello",
            optInt: null,
            optBool: false,
            optStr: "world",
            nested: Nested{
                val: 888,
                optVal: null
            }
        };
    }
}