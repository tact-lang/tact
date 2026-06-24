struct InnerStr {
    s: String;
}

struct MiddleStr {
    i: InnerStr;
}

contract StringDeep {
    chain: MiddleStr;

    init() {
        self.chain = MiddleStr {
            i: InnerStr {
                s: "deepstr",
            },
        };
    }
}
