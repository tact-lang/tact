struct MixedTypes {
    foo: Int;
    bar: Bool?;
    baz: String;
    qux: Address?;
}

contract MixedTypesStorage {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{
            foo: 42,
            bar: null,
            baz: "hello",
            qux: null
        };
    }
}
