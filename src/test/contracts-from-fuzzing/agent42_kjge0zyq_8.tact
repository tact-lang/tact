struct Mini {
    v: Int as uint8;
}

struct Wrapper {
    m: Mini?;
}

contract OutOfRangeInit {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            m: Mini{ v: 512 }
        };
    }
}