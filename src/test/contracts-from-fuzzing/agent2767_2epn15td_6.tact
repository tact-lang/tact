struct DeepOpt {
    nestedOpt: Int?;
}

struct MidOpt {
    child: DeepOpt?;
}

contract NestedOptional {
    complex: MidOpt?;

    init() {
        self.complex = null;
    }
}