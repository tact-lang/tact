struct Deep {
    x: Int;
    y: Bool;
}

struct Middle {
    m: Deep;
    n: Int;
}

contract NestedContract {
    item: Middle;

    init() {
        self.item = Middle{m: Deep{x: 10, y: false}, n: 5};
    }
}