struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{ x:1, y:true };
    }
}