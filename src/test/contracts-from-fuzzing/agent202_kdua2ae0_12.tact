struct DeepOptional {
    inner: InnerOptional?;
}

struct InnerOptional {
    inner2: InnerMostOptional?;
    flag: Bool;
}

struct InnerMostOptional {
    str: String?;
}

contract DeepNullableStorage {
    val: DeepOptional;

    init() {
        self.val = DeepOptional{
            inner: null
        };
    }
}