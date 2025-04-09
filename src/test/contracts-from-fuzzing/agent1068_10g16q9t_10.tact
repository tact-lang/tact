struct DeepNested {
    val: Int;
    optStr: String?;
}

struct Outer {
    inner: DeepNested?;
    info: String;
}

contract TestContract {
    storage: Outer?;

    init() {
        self.storage = null;
    }

    receive() {
        self.storage = self.storage;
    }
}
