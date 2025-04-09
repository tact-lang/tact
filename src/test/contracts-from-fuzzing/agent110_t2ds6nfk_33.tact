struct One {
    a: Int;
}

contract Mixing {
    x: One?;
    y: One;

    init() {
        self.x = null;
        self.y = One{a:1};
    }
}