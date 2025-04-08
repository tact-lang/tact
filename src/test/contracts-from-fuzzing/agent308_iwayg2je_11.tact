message EmptyOne {}
message EmptyTwo {}

struct Wrap {
    m1: EmptyOne;
    m2: EmptyTwo;
}

contract MessageFields {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            m1: EmptyOne{},
            m2: EmptyTwo{}
        };
    }
}