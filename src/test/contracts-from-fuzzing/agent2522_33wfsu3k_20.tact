struct Level2 {
    value: Int; 
}

struct Level1 {
    nested: Level2?;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1 { nested: Level2 { value: 42 } };
    }
}