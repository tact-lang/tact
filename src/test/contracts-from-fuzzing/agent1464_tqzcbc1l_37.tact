message(11) InnerMessage {
    val: Int;
}

struct MiddleLayer {
    optMsg: InnerMessage?;
}

contract TestContract {
    middle: MiddleLayer?;

    init() {
        self.middle = null;
    }
}