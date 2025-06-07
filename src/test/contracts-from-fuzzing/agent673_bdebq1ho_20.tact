struct WithOpt {
    s: String?;
    b: Bool?;
}

struct Container {
    f1: Int;
    opt: WithOpt?;
    f2: Bool;
}

contract MidOptional {
    val: Container;

    init() {
        self.val = Container{
            f1: 1,
            opt: null,
            f2: true
        };
    }
}