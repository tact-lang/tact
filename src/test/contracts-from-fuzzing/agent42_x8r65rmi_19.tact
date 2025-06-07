struct Compose {
    x: Int;
    y: Bool;
}

contract TestContract {
    a: Compose?;
    b: Compose?;
    init() {
        self.a = null;
        self.b = Compose{ x: 1, y: true };
    }
}