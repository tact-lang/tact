struct MixedDefault {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "abc";
    optInt: Int?;
    optBool: Bool?;
}

contract DefaultVals {
    val: MixedDefault;

    init() {
        self.val = MixedDefault{
            optInt: null,
            optBool: null
        };
    }
}