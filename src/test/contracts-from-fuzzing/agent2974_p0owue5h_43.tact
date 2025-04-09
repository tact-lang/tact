struct Leaf { val: Int = -1; }

struct Mid {
    x: Int = 5;
    l: Leaf = Leaf{};
}

struct Top {
    m: Mid = Mid{};
    flag: Bool = true;
}

contract TestContract {
    state: Top;

    init() {
        self.state = Top{ };
    }
}