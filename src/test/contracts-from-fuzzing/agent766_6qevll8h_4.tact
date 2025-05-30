struct OptNest {
    maybe: Inner?;
}

struct Inner {
    s: String;
    flag: Bool;
}

contract Test {
    data: OptNest;

    init() {
        self.data = OptNest{
            maybe: Inner{
                s: "abc",
                flag: true
            }
        };
    }
}