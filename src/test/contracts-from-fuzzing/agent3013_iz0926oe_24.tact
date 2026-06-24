struct Level3 {
    text: String;
}

struct Level2 {
    some: Level3?;
}

struct Level1 {
    next: Level2?;
}

contract MultiNullable {
    root: Level1;

    init() {
        self.root = Level1{next:null};
    }
}
