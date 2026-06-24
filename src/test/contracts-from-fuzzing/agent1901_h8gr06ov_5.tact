struct Level2 {
    x: Int?;
    y: Bool = true;
    msg: String?;
}

struct Level1 {
    inner: Level2?;
    label: String = "ok";
}

contract DeepOptionalStruct {
    data: Level1;

    init() {
        self.data = Level1{};
    }
}