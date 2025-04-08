// test contract with optional nested struct defaults inline
struct InlineOpt {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract InlineOptionalStructTest {
    val: InlineOpt;

    init() {
        self.val = InlineOpt{};
    }
}