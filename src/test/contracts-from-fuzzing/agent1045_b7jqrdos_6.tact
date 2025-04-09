struct DeepLevel3 {
    z: Int = 3;
}

struct DeepLevel2 {
    y: DeepLevel3;
}

struct DeepLevel1 {
    x: DeepLevel2;
}

contract TestContract {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{ x: DeepLevel2{ y: DeepLevel3{ z: 33 } } };
    }

    receive() {
        self.deep = DeepLevel1{ x: DeepLevel2{ y: DeepLevel3{ z: 1 } } };
    }
}