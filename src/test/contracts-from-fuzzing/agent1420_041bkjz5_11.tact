message MsgTest {}

struct Container {
    m: MsgTest?;
}

contract TestContract {
    nestedOpt: Container?;
    init() {}
}