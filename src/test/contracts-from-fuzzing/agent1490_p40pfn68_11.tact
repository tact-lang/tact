struct Mid {
    intVal: Int;
    boolVal: Bool;
}

struct Top {
    nested1: Mid;
    nested2: Mid;
    nested3: Mid;
}

contract ManyNested {
    t: Top;

    init() {
        self.t = Top{
            nested1: Mid{ intVal: 1, boolVal: true },
            nested2: Mid{ intVal: 2, boolVal: false },
            nested3: Mid{ intVal: 3, boolVal: true },
        };
    }
}