struct InnerMost { value: Int; }
struct Level2 { next: InnerMost; }
struct Level1 { next: Level2; }

contract Chain {
    field: Level1;
    init() {
        self.field = Level1{ next: Level2{ next: InnerMost{ value: 42 } } };
    }
}