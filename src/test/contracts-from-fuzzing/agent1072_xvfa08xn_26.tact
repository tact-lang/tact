/// deeply optional nested struct
struct OptionInner {
    innerField: Int?;
}

struct OptionOuter {
    field: OptionInner?;
}

contract DeepOptional {
    val: OptionOuter?;
    init() {
        self.val = null;
    }
}