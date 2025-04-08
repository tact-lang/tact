struct Inner {
    val: Int?;
}

struct Outer {
    i: Int;
    nested: Inner;
}

contract TestContract {
    data: Outer = Outer{
        i: 77,
        nested: Inner{}
    };

    init() {}

    receive() {
        if (self.data.nested.val != null) {
            dump(self.data.nested.val!!);
        }
    }
}