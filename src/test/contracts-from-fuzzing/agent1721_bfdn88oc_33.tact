// struct with optional Cell inside optional struct inside optional struct
struct Level3 { c: Cell?; }
struct Level2 { l3: Level3?; }
struct Level1 { l2: Level2?; }

contract MultiOptionalCell {
    data: Level1;
    init() {
        self.data = Level1 { l2: null };
    }
}
