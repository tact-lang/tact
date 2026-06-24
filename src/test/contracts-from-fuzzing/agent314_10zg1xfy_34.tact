// optional struct with nested struct with optionals
struct DeepStruct {
    a: Int?;
    b: Bool?;
}

struct OptionOuter {
    inner: DeepStruct?;
}

contract OptionalOptionedStruct {
    val: OptionOuter?;
    init() {
        self.val = null;
    }
}