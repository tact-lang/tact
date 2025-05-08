struct Layer3 {
    x: Int?;
    y: String;
}

struct Layer2 {
    nested3: Layer3?;
    flag: Bool;
}

struct Layer1 {
    nested2: Layer2;
    count: Int?;
}

contract DeepOptionalStruct {
    top: Layer1?;

    init() {
        self.top = null;
    }
}