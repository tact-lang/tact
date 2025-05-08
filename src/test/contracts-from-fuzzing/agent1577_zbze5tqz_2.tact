struct Nested2 {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: Nested2?;
    init() {
        self.data = null;
    }
}