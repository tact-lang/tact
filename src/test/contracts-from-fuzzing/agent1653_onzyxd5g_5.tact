struct Deep {
    x: Int?;
}

struct Middle {
    inner: Deep;
}

contract TestContract {
    nested: Middle = Middle{inner: Deep{}};
    receive() {
        self.nested = Middle{inner: Deep{x: 1}};
    }
}