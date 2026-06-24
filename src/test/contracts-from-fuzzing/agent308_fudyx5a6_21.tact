struct First {
    num: Int;
}

struct Second {
    data: First;
}

struct Third {
    field: Second;
}

contract TripleNest {
    state: Third;

    init() {
        self.state = Third{
            field: Second{
                data: First{
                    num: 21
                }
            }
        };
    }
}
