// Contract with optional nested struct containing optional
struct OptInOpt {
    maybeBool: Bool?;
    maybeInt: Int?;
}

struct ContainerOpt {
    nestedOpt: OptInOpt?;
    plainInt: Int;
}

contract DoubleOpt {
    optField: ContainerOpt;

    init() {
        self.optField = ContainerOpt{nestedOpt: null, plainInt: 10};
    }
}