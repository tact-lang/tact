struct DeepLevel3 {
    z: Bool;
}

struct DeepLevel2 {
    y: Int;
    lvl3: DeepLevel3;
}

struct DeepLevel1 {
    x: String;
    lvl2: DeepLevel2;
}

contract NestedTest {
    top: DeepLevel1;
    init() {
        self.top = DeepLevel1{
            x: "hello",
            lvl2: DeepLevel2{ y: 99, lvl3: DeepLevel3{ z: true } }
        };
    }
}
