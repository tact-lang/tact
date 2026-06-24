struct DeepLevel3 {
    z: Bool;
}

struct DeepLevel2 {
    inner: DeepLevel3;
}

struct DeepLevel1 {
    inner: DeepLevel2;
}

contract ManyNestedTest {
    nest: DeepLevel1;
    init() {
        self.nest = DeepLevel1{ inner: DeepLevel2{ inner: DeepLevel3{ z: false } } };
    }
}