struct OptionalInner {
    val: Int;
}

struct OptionalContainer {
    innerOpt: OptionalInner?;
    flag: Bool;
}

contract TestContract {
    info: OptionalContainer;

    init() {
        self.info = OptionalContainer{
            innerOpt: null,
            flag: true,
        };
    }
}