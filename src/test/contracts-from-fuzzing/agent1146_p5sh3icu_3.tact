struct DeepOptional {
    x: Int?;
    y: Bool;
}

contract OptionalTest {
    s: DeepOptional;

    init() {
        self.s = DeepOptional{
            x: null,
            y: true
        };
    }
}