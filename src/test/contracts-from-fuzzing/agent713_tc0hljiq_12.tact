struct Child {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    data: Child?;
    init() {
        self.data = Child{
            x: 99,
            y: false
        };
    }
}