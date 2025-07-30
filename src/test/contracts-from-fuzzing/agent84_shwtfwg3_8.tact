struct One {
    x: Int;
}

struct Two {
    y: Bool;
}

struct Combo {
    a: One?;
    b: Two;
}

contract TestContract {
    val: Combo = Combo{ a: null, b: Two{ y: true } };

    init() {
        self.val = self.val;
    }
}