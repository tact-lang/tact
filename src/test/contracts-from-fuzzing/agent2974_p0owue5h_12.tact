// optional struct type for contract storage
struct Coordinates {
    x: Int;
    y: Int;
}

contract TestContract {
    pos: Coordinates?;

    init() {
        self.pos = null;
    }
}