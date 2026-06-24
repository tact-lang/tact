message(101) TinyMsg {
    val: Int;
}

struct Container {
    inside: TinyMsg?;
}

contract Test {
    hold: Container;

    init() {
        self.hold = Container{
            inside: null,
        };
    }
}