struct DeepOptional {
    nested: Int?;
    text: String;
}

struct WrappingOptional {
    opt: DeepOptional?;
    flag: Bool;
}

contract OptionalInOptionalTest {
    val: WrappingOptional;

    init() {
        self.val = WrappingOptional{
            opt: null,
            flag: false,
        };
    }
}