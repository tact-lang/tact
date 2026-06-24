struct TopContain {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract MultiTypeStruct {
    top: TopContain;

    init() {
        self.top = TopContain {
            f1: 77,
            f2: false,
            f3: "hi"
        };
    }
}
