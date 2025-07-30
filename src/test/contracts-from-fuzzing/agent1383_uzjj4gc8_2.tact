struct NestedStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract NestedContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            a: 1,
            b: null,
            c: "nested"
        };
    }
}