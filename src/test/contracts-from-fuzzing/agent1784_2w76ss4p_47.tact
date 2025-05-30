struct DeepOptWrap {
    inner: OptionStructs?;
}

struct OptionStructs {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract DeepOptStructs {
    val: DeepOptWrap;

    init() {
        self.val = DeepOptWrap{
            inner: null
        };
    }
}