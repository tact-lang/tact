struct Sub1 { x: Int }
struct Sub2 { y: Bool }

struct Container {
    s1: Sub1;
    s2: Sub2;
    optInt: Int?;
    optStr: String?;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            s1: Sub1{ x: 42 },
            s2: Sub2{ y: true },
            optInt: null,
            optStr: "abc"
        };
    }
}
