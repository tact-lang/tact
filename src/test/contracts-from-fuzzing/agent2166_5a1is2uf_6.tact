struct NestOpt {
    inner: Int?;
    label: String;
}

struct DeepOpt {
    nested: NestOpt?;
    flag: Bool;
}

contract OptStructInStruct {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            nested: null,
            flag: true
        };
    }
}
