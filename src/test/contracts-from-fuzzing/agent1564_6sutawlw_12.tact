struct NestedWrap {
    text: String;
    innerOpt: Int?;
}

contract NestedWithNullableField {
    val: NestedWrap?;

    init() {
        self.val = null;
    }
}