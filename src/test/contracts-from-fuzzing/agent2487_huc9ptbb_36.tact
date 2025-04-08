struct Compose {
    x: Int;
    y: Int;
}

struct Wrap {
    first: Compose;
    second: Compose;
}

contract TestContract {
    field: Wrap;

    init() {
        self.field = Wrap{
            first: Compose{ x:1, y:2 },
            second: Compose{ x:3,y:4 }
        };
    }
}