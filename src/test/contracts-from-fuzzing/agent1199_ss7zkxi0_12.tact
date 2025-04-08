struct MixedStruct {
    a: String;
    b: String?;
    c: Int;
    d: Bool;
}

contract TestContract {
    data: MixedStruct;

    init() {
        self.data = MixedStruct{
            a: "hello",
            b: null,
            c: 42,
            d: true
        };
    }
}