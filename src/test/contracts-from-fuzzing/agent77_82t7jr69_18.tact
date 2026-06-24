message(100) InnerMsg {
    x: Int;
    y: Bool;
}

struct Container {
    payload: InnerMsg;
}

contract TestContract {
    data: Container = Container{payload: InnerMsg{x: 7, y: true}};
    init() {}
}