struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: InnerOpt?;

    init() {
        self.data = InnerOpt{
            x: 123,
            y: false
        };
    }
}