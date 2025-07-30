struct Nested {
    inner1: Int;
    inner2: Bool;
}

struct Wrapper {
    n: Nested;
    flag: Bool;
}

contract DeepContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            n: Nested{ inner1: 10, inner2: false },
            flag: true
        };
    }
}