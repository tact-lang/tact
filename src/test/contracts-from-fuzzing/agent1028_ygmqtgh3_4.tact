struct InnerOpt {
    x: Int?;
    y: Bool;
}

contract TestStructOpt {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{
            x: null,
            y: false
        };
    }
}