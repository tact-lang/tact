message(22) Msg {
    foo: Int;
}

struct Nested {
    bar: Msg?;
}

contract TestContract {
    val: Nested? = null;

    init() {
        self.val = null;
    }
}