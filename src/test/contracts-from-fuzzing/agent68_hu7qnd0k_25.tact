struct Narrower {
    val: Int as uint4;
}

struct Wrap {
    field: Narrower;
}

contract OutOfRangeInit {
    big: Wrap;

    init() {
        self.big = Wrap{
            field: Narrower{ val: 5000 }
        };
    }
}
