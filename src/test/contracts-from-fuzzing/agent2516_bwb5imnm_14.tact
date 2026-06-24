struct SomeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
}

contract Defaults {
    complex: SomeStruct = SomeStruct{ a: 42, b: true, c: null, d: "hi" };

    init() {
        self.complex = SomeStruct{
            a: 1,
            b: false,
            c: null,
            d: "hello",
        };
    }
}