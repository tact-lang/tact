struct OptionalDeep {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
    sub: SubDeep?;
}

struct SubDeep {
    subval1: String?;
    subval2: Int?;
    subval3: Address?;
}

contract OptionalDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            val1: null,
            val2: null,
            val3: null,
            sub: null,
        };
    }
}
