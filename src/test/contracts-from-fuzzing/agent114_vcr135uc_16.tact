struct HoldsOptString {
    foo: String?;
}

contract SingleOptionalStringStruct {
    val: HoldsOptString;

    init() {
        self.val = HoldsOptString{ foo: null };
    }
}
