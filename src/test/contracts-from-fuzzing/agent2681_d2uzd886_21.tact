struct Down {
    a: Int;
}

struct Middle {
    d: Down;
}

struct Up {
    m: Middle;
}

contract NestedChain {
    up: Up;

    init() {
        self.up = Up{m: Middle{d: Down{a: 1}}};
    }
}