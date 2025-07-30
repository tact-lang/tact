struct MixDepth {
    a: Int;
    b: Bool;
    c: OptStruct?;
}

struct OptStruct {
    d: Int;
    e: Bool?;
}

contract MixedOptions {
    val: MixDepth;

    init() {
        self.val = MixDepth{
            a: 7,
            b: false,
            c: OptStruct{
                d: 99,
                e: null
            }
        };
    }
}