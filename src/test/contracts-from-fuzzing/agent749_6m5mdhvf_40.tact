struct InnerBool {
    flag: Bool?;
}

contract OptionalBoolStruct {
    val: InnerBool;

    init() {
        self.val = InnerBool{ flag: null };
    }
}