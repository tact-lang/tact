struct Msg { id: Int; }

contract OptionalMessageField {
    m: Msg?;
    init() {
        self.m = null;
    }
}
