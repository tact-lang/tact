struct Level3 {
    value: Int?;
}

struct Level2 {
    leaf: Level3?;
}

contract TestContract {
    data: Level2?;

    init() {
        self.data = null;
    }

    receive() {
        self.data;
    }
}