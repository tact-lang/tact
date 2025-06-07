struct SomeStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    s: SomeStruct?;

    init() {
        self.s = SomeStruct{
            a: 10,
            b: true
        };
    }
}