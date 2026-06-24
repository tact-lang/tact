struct MixNestedOptional {
    foo: Int;
    bar: Bool?;
    baz: String;
}

contract MixedOptionalNested {
    myStruct: MixNestedOptional?;

    init() {
        self.myStruct = null;
    }
}