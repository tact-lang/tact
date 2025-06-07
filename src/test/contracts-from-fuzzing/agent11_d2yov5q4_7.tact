struct Inner1 { val: Int }
struct Inner2 { val: Int }
struct Inner3 { val: Int }

struct Mid {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract StackNested {
    m: Mid;

    init() {
        self.m = Mid{
            i1: Inner1{ val: 1},
            i2: Inner2{ val: 2},
            i3: Inner3{ val: 3},
        };
    }
}