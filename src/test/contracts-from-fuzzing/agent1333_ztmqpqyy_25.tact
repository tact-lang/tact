struct Inner {
    val: Int? = null;
}

struct Outer {
    nested: Inner = Inner{};
}

contract TestContract {
    data: Outer = Outer{};

    init() {}

    receive() {
        if(self.data.nested.val != null) {
            dump(self.data.nested.val!!);
        }
    }
}