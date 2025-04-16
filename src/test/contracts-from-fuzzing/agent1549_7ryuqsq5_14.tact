struct OptStruct {
    num: Int?;
    txt: String?;
}

struct InContainer {
    inner: OptStruct?;
    fl: Bool;
}

contract Test {
    x: InContainer;
    init() {
        self.x = InContainer{ inner: null, fl: false };
    }
}