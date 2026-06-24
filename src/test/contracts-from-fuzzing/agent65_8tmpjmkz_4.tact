struct DefaultsOpt {
    foo: Int = 7;
    bar: Bool = true;
    opt: Int?;   // implicit default null
}

contract DefaultsTest {
    example: DefaultsOpt;

    init() {
        self.example = DefaultsOpt{
            opt: null
        };
    }
}