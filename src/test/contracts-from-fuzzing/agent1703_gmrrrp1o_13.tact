struct Msg {
    c: Cell;
}

struct Wrap1 {
    msg: Msg;
}

struct Wrap2 {
    wrap1: Wrap1;
}

struct Wrap3 {
    wrap2: Wrap2;
}

contract ManyWraps {
    nested: Wrap3;

    init() {
        self.nested = Wrap3{
            wrap2: Wrap2{
                wrap1: Wrap1{
                    msg: Msg{ c: emptyCell() }
                }
            }
        };
    }
}