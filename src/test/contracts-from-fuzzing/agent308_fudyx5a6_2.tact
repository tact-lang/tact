struct SingleOptional {
    optBool: Bool?;
}

contract SingleOptionalTest {
    persistent: SingleOptional;

    init() {
        self.persistent = SingleOptional{
            optBool: null,
        };
    }
}
