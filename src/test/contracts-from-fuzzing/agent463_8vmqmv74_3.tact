struct DeepInner {
    x: Int;
    y: Int?;
    z: Bool;
}

struct DeepOuter {
    nested: DeepInner;
}

contract TestContract {
    myData: DeepOuter;

    init() {
        self.myData = DeepOuter{ nested: DeepInner{ x: 1, y: null, z: true } };
    }
}