struct Inner {
    x: Int;
    y: Bool;
}

contract OptField {
    deepOpt: Inner?;

    init() {
        self.deepOpt = Inner{
            x: 12,
            y: false,
        };
    }
}