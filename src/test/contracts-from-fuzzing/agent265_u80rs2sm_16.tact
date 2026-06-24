struct NestedOptionalStr {
    nested: OptionalString?;
}

struct OptionalString {
    strField: String?;
}

contract OptNestedStrTest {
    optWrapper: NestedOptionalStr;

    init() {
        self.optWrapper = NestedOptionalStr{
            nested: OptionalString{ strField: null }
        };
    }

    receive() {
        self.optWrapper = self.optWrapper;
    }
}