// optional struct with nested options

struct DeepInner {
    f1: Int?;
    f2: Bool?;
}

struct MidStruct {
    deep: DeepInner?;
    s: String;
}

contract OptionalMultiple {
    val: MidStruct?;

    init() {
        self.val = null;
    }
}