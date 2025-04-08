struct OnlyString {
    s: String;
}

struct ContainsOpt {
    maybe: OnlyString?;
}

contract OptionalNestedString {
    val: ContainsOpt;

    init() {
        self.val = ContainsOpt{ maybe: null };
    }
}