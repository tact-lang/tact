struct MultiNested {
    n1: Int;
    n2: Bool;
    opt1: Int?;
    opt2: Bool?;
    s1: Sub1;
    s2: Sub2;
}

struct Sub1 {
    x: Int;
    y: String;
}

struct Sub2 {
    flag: Bool;
    msg: String?;
}

contract TestContract {
    val: MultiNested;

    init() {
        self.val = MultiNested{
            n1: 1,
            n2: true,
            opt1: null,
            opt2: false,
            s1: Sub1{ x: 5, y: "hi" },
            s2: Sub2{ flag: true, msg: null }
        };
    }
}