struct DeepOpts {
    nested: Middle?;
}

struct Middle {
    inner: Int?;
}

contract OptTree {
    val: DeepOpts;

    init() {
        self.val = DeepOpts{
            nested: Middle{ inner: null }
        };
    }
}