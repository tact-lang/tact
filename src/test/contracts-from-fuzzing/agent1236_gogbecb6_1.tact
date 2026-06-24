struct NestedVals {
    flag: Bool;
    counter: Int;
    text: String;
}

contract BasicStorage {
    nested: NestedVals;

    init() {
        self.nested = NestedVals{
            flag: true,
            counter: 10,
            text: "Hello"
        };
    }
}