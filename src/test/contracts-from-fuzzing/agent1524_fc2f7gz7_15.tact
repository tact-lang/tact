// test optional struct as optional persistent state
struct SomeStruct {
    x: Int;
    y: Bool;
}

contract OptStructField {
    s: SomeStruct?;

    init() {
        self.s = SomeStruct{ x: 42, y: false };
    }
}