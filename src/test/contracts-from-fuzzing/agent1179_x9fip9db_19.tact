struct EmbeddedOptional {
    s: String?;
}

struct Wrapper {
    opt: EmbeddedOptional;
}

contract ContractWithWrapper {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            opt: EmbeddedOptional { s: null }
        };
    }

    receive() {}
}