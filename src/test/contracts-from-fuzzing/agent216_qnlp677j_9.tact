struct OptionalsNested {
    nested: OptionalInner?;
}

struct OptionalInner {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract NestedOptionalsTest {
    val: OptionalsNested;

    init() {
        self.val = OptionalsNested{ nested: null };
    }
}