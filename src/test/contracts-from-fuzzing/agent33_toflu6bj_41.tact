message(42) Msg { x: Int; }

contract TestContract {
    m: Msg?;

    init() {
        self.m = null;
    }
}