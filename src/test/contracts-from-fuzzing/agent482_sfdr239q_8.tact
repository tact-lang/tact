struct InnerMost {
    z: Int?;
}

struct Middle {
    inner: InnerMost?;
    flag: Bool;
}

contract DeepNestOptional {
    content: Middle?;

    init() {
        self.content = null;
    }
}
