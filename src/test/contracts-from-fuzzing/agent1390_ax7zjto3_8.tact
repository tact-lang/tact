struct Inner1 {
    val: Int;
}

struct Inner2 {
    flag: Bool;
}

struct Outer {
    variant: Bool;
    choice1: Inner1?;
    choice2: Inner2?;
}

contract UnionStyle {
    u: Outer;

    init() {
        self.u = Outer{
            variant: true,
            choice1: Inner1{val: 5},
            choice2: null,
        };
    }
}