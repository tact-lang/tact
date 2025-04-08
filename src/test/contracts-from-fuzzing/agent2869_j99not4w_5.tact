struct Inner {
    val1: Int;
    val2: Bool;
}

contract ArrayLike {
    elem1: Inner;
    elem2: Inner;
    elem3: Inner;
    elem4: Inner;

    init() {
        self.elem1 = Inner{val1: 1, val2: true};
        self.elem2 = Inner{val1: 2, val2: false};
        self.elem3 = Inner{val1: 3, val2: true};
        self.elem4 = Inner{val1: 4, val2: false};
    }
}
