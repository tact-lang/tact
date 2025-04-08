struct Inner {
    x: Int?;
}

struct Middle {
    inr: Inner;
}

struct Deep {
    mid: Middle;
}

contract TestContract {
    nested: Deep? = null;

    receive() {
        self.nested = Deep{mid: Middle{inr: Inner{x: 3}}};
    }
}