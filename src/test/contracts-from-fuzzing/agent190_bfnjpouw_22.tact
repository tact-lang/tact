message(0x1) Info {
    foo: Int;
}

struct Wrap {
    inner: Info?;
}

contract TestContract {
    rec: Wrap?;

    init() {
        self.rec = null;
    }
}