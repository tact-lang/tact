struct Inner {
    x: Int?;
}

struct Middle {
    inr: Inner?;
}

contract TestContract {
    nested: Middle? = null;

    receive() {
        self.nested = Middle{inr: Inner{x: 42}};
    }
}