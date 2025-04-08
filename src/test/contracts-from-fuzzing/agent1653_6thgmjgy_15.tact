// Contract field type: optional struct nested inside optional struct
struct Level2 {
    z: Int;
}

struct Level1 {
    nested: Level2?;
    txt: String;
}

contract TestContract {
    data: Level1?;

    init() {
        self.data = null;
    }
}