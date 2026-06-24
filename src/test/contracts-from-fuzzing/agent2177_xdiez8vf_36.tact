message(42) MsgA { v: Int }
message(43) MsgB { s: String }

struct Container {
    a: MsgA;
    b: MsgB;
}

contract MessageStructContainer {
    c: Container;

    init() {
        self.c = Container{
            a: MsgA{v:1},
            b: MsgB{s:"s"}
        };
    }
}