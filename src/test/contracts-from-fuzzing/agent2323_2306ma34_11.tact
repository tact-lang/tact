struct IntStringBool {
    foo: Int;
    bar: String;
    baz: Bool;
}

contract MixedTypesTest {
    val: IntStringBool;

    init() {
        self.val = IntStringBool{
            foo: 1,
            bar: "str",
            baz: false
        };
    }
}