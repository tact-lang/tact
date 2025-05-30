struct HasOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalsInStruct {
    val: HasOptionals;

    init() {
        self.val = HasOptionals{foo: null, bar: null, baz: null};
    }
}