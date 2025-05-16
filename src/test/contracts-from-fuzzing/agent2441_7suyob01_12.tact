struct SomeStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract FieldOrdering {
    a: Int = 1;
    b: SomeStruct;
    c: Bool = false;

    init() {
        self.b = SomeStruct{
            x: 7,
            y: true,
            z: "hi",
        };
    }
}