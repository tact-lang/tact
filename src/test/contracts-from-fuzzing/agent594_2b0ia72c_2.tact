struct DeepOpt {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract Test2 {
    deep: DeepOpt;

    init() {
        self.deep = DeepOpt{
            a: null,
            b: true,
            s: null,
        };
    }

    receive() {}
}