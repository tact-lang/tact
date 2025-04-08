struct Sample {
    a: Int;
}

contract OptionalStructVar {
    data: Sample?;

    init() {
        self.data = null;
    }
}