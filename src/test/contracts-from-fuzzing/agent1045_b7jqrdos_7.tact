struct DeepOptLevel3 {
    z: Int?;
}

struct DeepOptLevel2 {
    y: DeepOptLevel3;
}

struct DeepOptLevel1 {
    x: DeepOptLevel2;
}

contract TestContract {
    deep: DeepOptLevel1;

    init() {
        self.deep = DeepOptLevel1{ x: DeepOptLevel2{ y: DeepOptLevel3{ z: null } } };
    }

    receive() {
        self.deep = DeepOptLevel1{ x: DeepOptLevel2{ y: DeepOptLevel3{ z: 55 } } };
    }
}