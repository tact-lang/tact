struct Msg {  x: Int; }

struct Wrap {
    inner: Msg?;
}

contract OptionalWrapped {
    w: Wrap?;

    init() {
        self.w = null;
    }
}