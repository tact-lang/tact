struct Inner {
    x: Int;
}

contract RedundantInit {
    val: Inner = Inner{ x: 1 };
    init() {
        self.val = Inner{ x:2 };
    }
}