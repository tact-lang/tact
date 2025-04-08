struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Middle {
    nested: InnerMost?;
    flag: Bool;
}

struct Top {
    nested: Middle?;
    done: Bool;
}

contract DeepOptionalChain {
    data: Top;

    init() {
        self.data = Top{
            nested: Middle{
                nested: null,
                flag:true
            },
            done: false
        };
    }
}