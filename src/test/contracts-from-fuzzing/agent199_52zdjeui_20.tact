struct MixedDeepOpts {
    foo: Int?;
    bar: DeepLevel?;
}

struct DeepLevel {
    a: String?;
    b: Bool?;
}

contract DeepOptStruct {
    val: MixedDeepOpts;

    init() {
        self.val = MixedDeepOpts{
            foo: null,
            bar: null,
        };
    }
}