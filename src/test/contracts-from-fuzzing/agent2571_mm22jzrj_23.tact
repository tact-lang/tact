struct One {
    a: Int?;
}

struct Two {
    b: One?;
}

contract OptOptStruct {
    something: Two?;

    init() {
        self.something = Two{
            b: One{
                a: null
            }
        };
    }
}
