struct Recursing {
    child: Child?;
}

struct Child {
    value: Int;
    deeper: Deeper?;
}

struct Deeper {
    flag: Bool;
    message: String?;
}

contract Test {
    state: Recursing;

    init() {
        self.state = Recursing{ child: Child{ value: 5, deeper: Deeper{ flag: true, message: null } } };
    }
}