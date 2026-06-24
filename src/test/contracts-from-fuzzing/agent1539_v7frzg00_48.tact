struct WrapOpt {
    field: Int?;
}

contract OptionalWrapTest {
    val: WrapOpt?;
    init() {
        self.val = null;
    }
}