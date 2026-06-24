struct InnerOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Test {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{
            x: null,
            y: null,
            z: null
        };
    }
}
