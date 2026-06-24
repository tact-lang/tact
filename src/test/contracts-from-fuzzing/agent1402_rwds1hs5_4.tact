struct DefaultOpt {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
}

contract OptionalTest {
    foo: DefaultOpt;

    init() {
        self.foo = DefaultOpt{
            optInt: null,
            optBool: null,
            optAddr: null
        };
    }
}