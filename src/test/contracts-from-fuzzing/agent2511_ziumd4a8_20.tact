struct Pair {
    first: Int;
    second: Int;
}

struct Container {
    a: Pair;
    b: Pair;
}

contract PairStore {
    data: Container;

    init() {
        self.data = Container{
            a: Pair{first:1, second:2},
            b: Pair{first:3, second:4}
        };
    }
}