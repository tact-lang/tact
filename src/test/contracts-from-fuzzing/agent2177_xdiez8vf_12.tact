struct SomeStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructTest {
    opt: SomeStruct?;

    init() {
        self.opt = SomeStruct{a: 42, b: true};
    }
}