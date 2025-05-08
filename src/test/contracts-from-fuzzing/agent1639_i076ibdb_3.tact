struct OptionalInner {
    val: Int;
}

struct OptionalHolder {
    innerOpt: OptionalInner?;
}

contract TestContract {
    container: OptionalHolder?;

    init() {
        self.container = null;
    }
}