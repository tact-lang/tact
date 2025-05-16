struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Builder?;
}

struct ContainerOpt {
    inner: DeeplyOptional?;
}

contract DeepOptionals {
    val: ContainerOpt;

    init() {
        self.val = ContainerOpt{ inner:null };
    }
}