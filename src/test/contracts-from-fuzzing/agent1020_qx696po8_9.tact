struct Mix {
    intVal: Int;
    boolVal: Bool;
    optionalInt: Int?;
    optionalBool: Bool?;
    nestedStruct: Inner;
}

struct Inner {
    x: Int;
    flag: Bool;
}

contract MixTest {
    m: Mix;

    init() {
        self.m = Mix{
            intVal: 1,
            boolVal: true,
            optionalInt: null,
            optionalBool: null,
            nestedStruct: Inner{ x: 42, flag: false }
        };
    }
}