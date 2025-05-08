struct DeepOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract OptTest {
    x: DeepOptional;

    init() {
        self.x = DeepOptional{
            a: null,
            b: null,
            c: true,
            d: null,
        };
    }

    receive() {
        self.x = self.x;
    }
}