struct NestedOptionals {
    foo: Int?;
    bar: Bool;
    baz: String?;
}

contract OptionalFields {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{ foo:null, bar:true, baz:"hello" };
    }
}