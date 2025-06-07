struct Simple {
    x: Int;
}

contract OptSimple {
    data: Simple?;
    init() {
        self.data = Simple{ x: 77 };
    }
}