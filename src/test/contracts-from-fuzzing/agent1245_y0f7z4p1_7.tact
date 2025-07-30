struct First {
    inner: Second;
}

struct Second {
    deeper: Third;
}

struct Third {
    val: Int;
}

contract MultiNested {
    nestedData: First;

    init() {
        self.nestedData = First{
            inner: Second{
                deeper: Third{
                    val: 9001,
                },
            },
        };
    }
}
