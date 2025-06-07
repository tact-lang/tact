struct Tuple1 {
    a: Int;
}

struct Tuple2 {
    b: Tuple1;
}

struct Tuple3 {
    c: Tuple2;
}

struct Tuple4 {
    d: Tuple3;
}

contract TestContract {
    val: Tuple4;

    init() {
        self.val = Tuple4 {
            d: Tuple3 {
                c: Tuple2 {
                    b: Tuple1 {
                        a: 42,
                    },
                },
            },
        };
    }
}