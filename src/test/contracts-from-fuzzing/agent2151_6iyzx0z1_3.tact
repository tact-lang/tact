struct Pair {
    a: Int;
    b: Int?;
}

struct Tuple {
    first: Pair;
    second: Pair;
    third: Pair;
}

contract Combo {
    value: Tuple;

    init() {
        self.value = Tuple{
            first: Pair{a: 1, b: null},
            second: Pair{a: 2, b: 3},
            third: Pair{a: 4, b: null}
        };
    }
}