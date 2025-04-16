struct WrappedString {
    s: String;
}

struct ContainerOpt {
    opt: WrappedString?;
}

contract OptionStructContainingString {
    optContainer: ContainerOpt;

    init() {
        self.optContainer = ContainerOpt{
            opt: null,
        };
    }
}