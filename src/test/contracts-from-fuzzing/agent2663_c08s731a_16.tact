struct DeepOpt {
    a: Option1?;
}

struct Option1 {
    b: Option2?;
}

struct Option2 {
    c: Option3?;
}

struct Option3 {
    d: Int?;
}

contract NestedOptionChains {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            a: null
        };
    }
}