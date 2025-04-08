struct NestedStr {
    s1: String;
    s2: InnerOpt;
}

struct InnerOpt {
    s3: String?;
    s4: String;
}

contract TestContract {
    data: NestedStr;

    init() {
        self.data = NestedStr {
            s1: "s1",
            s2: InnerOpt {
                s3: null,
                s4: "s4"
            }
        };
    }
}