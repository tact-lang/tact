// Contract with nested optional str inside nested optional struct
struct DeepOptStr {
    text: String?;
}

struct OuterOptStruct {
    innerOpt: DeepOptStr?;
}

contract DoubleOptionalString {
    val: OuterOptStruct?;

    init() {
        self.val = null;
    }
}
