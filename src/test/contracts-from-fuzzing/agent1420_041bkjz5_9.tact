message MsgTest {}

struct Container {
    m: MsgTest?;
}

contract TestContract {
    cont: Container = Container{ m: null };
    init() {}
}