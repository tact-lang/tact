struct Level3 {
    val3: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract TestContract {
    l1: Level1?;

    init() {
        self.l1 = null;
    }

    receive() {
        if (self.l1 != null) {
            dump(1);
        }
    }
}