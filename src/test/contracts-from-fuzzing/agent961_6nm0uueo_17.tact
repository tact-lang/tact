struct IntOption {
    value: Int?;
}

struct IntWrapper {
    opt: IntOption;
}

contract ChainOptionalContract {
    data: IntWrapper;

    init() {
        self.data = IntWrapper{ opt: IntOption{ value: null } };
    }
}