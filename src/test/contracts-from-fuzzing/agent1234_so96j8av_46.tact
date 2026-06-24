struct Tiny {
    x: Int as uint4;
}

contract OutOfRangeInit {
    val: Tiny;

    init() {
        self.val = Tiny{ x: 20 };
    }
}