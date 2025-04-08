struct DeepOptional {
    alpha: Int?;
    beta: Bool?;
    gamma: Slice?;
    delta: Address?;
}

contract OptionalDeepTest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            alpha: null,
            beta: true,
            gamma: null,
            delta: myAddress()
        };
    }
}
