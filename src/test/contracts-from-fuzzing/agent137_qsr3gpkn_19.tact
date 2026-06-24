struct DefaultsAndOpt {
    a: Int = 5;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract DefaultValTest {
    data: DefaultsAndOpt;

    init() {
        self.data = DefaultsAndOpt{
            c: null,
            d: null
        };
    }

    receive() {}
}