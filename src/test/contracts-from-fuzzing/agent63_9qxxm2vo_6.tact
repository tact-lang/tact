struct Combo {
    foo: Int = 7;
    bar: Bool?;
    baz: String = "hi";
}

contract ComboStruct {
    val: Combo;

    init() {
        self.val = Combo{
            bar: null
        };
    }
}