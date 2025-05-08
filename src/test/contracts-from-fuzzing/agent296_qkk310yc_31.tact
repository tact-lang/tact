struct DefaultsMix {
    a: Int = 5;
    b: Bool?;
    c: String = "fixed";
}

contract DefaultsMixTest {
    data: DefaultsMix;

    init() {
        self.data = DefaultsMix{
            b: null
        };
    }
}
