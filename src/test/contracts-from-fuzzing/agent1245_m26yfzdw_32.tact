struct Low1 {
    v: Int;
}
struct Low2 {
    s: String;
}

struct High {
    l1: Low1;
    l2: Low2;
}

contract HighStore {
    h: High;

    init() {
        self.h = High{
            l1: Low1{ v: 9 },
            l2: Low2{ s: "S" },
        };
    }
}
