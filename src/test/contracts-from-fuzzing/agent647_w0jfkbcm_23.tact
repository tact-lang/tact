// empty contract with one optional nested message type
message(1) Msg {}

struct Wrap {
    m: Msg?;
}

contract TestContract {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{ m: null };
    }
}