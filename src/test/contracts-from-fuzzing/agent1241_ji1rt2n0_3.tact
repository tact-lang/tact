struct OptNested {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: OptNested;

    init() {
        self.data = OptNested{
            foo: null,
            bar: true,
        };
    }
}