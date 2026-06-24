struct NestedOpt {
    x: Int?;
    y: String?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            x: null,
            y: null,
        };
    }
}