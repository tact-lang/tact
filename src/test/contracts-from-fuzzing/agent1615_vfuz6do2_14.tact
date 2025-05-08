struct Level4 {
    leaf: String;
}

struct Level3 {
    next: Level4?;
    flag: Bool;
}

struct Level2 {
    next: Level3;
    count: Int?;
}

struct Level1 {
    next: Level2?;
    name: String;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1 {
            next: Level2 {
                next: Level3 {
                    next: null,
                    flag: true
                },
                count: null
            },
            name: "hi"
        };
    }

    receive() {}
}