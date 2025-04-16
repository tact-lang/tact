struct Simple {
    x: Int;
    b1: Bool;
}

contract TestContract {
    opt: Simple?;

    init() {
        self.opt = Simple{x:42, b1:false};
    }
}