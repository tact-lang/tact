struct SomeStruct {
    a: Int;
    b: Bool?;
}

contract PartialDefault {
    s: SomeStruct;

    init() {
        self.s = SomeStruct{ a: 1, b: null };
    }
}