struct DeepLevel3 {
    z: Int;
}

struct DeepLevel2 {
    y: DeepLevel3;
}

struct DeepLevel1 {
    x: DeepLevel2;
}

contract TestContract {
    deep: DeepLevel1 = DeepLevel1{ x: DeepLevel2 { y: DeepLevel3{z: 9} } };

    init() {
        self.deep = DeepLevel1{ x: DeepLevel2 { y: DeepLevel3{z: 11} } };
    }

    receive() {
        let _ = self.deep.x.y.z;
    }
}