struct BothOpt {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: BothOpt;

    init() {
        self.data = BothOpt{
            foo: null,
            bar: null,
        };
    }
}