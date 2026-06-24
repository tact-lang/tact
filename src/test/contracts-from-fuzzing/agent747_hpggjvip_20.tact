struct Outer {
    x: Int;
    innerOpt: Inner?;
}

struct Inner {
    y: Int;
    innermostOpt: Innermost?;
}

struct Innermost {
    z: Int;
    flag: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer {
            x: 1,
            innerOpt: Inner {
                y: 2,
                innermostOpt: null,
            },
        };
    }
}