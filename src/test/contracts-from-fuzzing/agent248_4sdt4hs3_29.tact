struct Ordering {
    z: Int;
    y: Int;
    x: Int;
}

contract TestContract {
    order: Ordering;

    init() {
        self.order = Ordering{ z:3, y:2, x:1 };
    }
}