struct BigOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionsTest {
    f: BigOptions;

    init() {
        self.f = BigOptions{
            a: null,
            b: true,
            c: null,
            d: null,
        };
    }
}