struct SomeData {
    foo: Int? = 1;
}

contract TestOptDef {
    val: SomeData;

    init() {
        self.val = SomeData{ foo: null };
    }
}