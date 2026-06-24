struct OptNested {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    s: OptNested;

    init() {
        self.s = OptNested{
            x: null,
            y: true
        };
    }
}