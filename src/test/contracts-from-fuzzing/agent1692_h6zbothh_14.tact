struct Level4 {
    val: Int;
}

struct Level3 {
    next: Level4?;
}

struct Level2 {
    next: Level3?;
}

struct Level1 {
    next: Level2?;
}

contract DeepOptionals {
    pointer: Level1;

    init() {
        self.pointer = Level1{
            next: null
        };
    }
}