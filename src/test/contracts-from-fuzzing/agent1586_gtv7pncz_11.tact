struct Left {
    a: Int;
}
struct Right {
    b: Int;
}

struct Level2 {
    left: Left;
    right: Right;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract WideBranches {
    root: Level1;

    init() {
        self.root = Level1 {
            l2a: Level2 {
                left: Left { a: 1 },
                right: Right { b: 2 }
            },
            l2b: Level2 {
                left: Left { a: 3 },
                right: Right { b: 4 }
            },
        };
    }
}