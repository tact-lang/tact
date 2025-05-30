struct DeepLevel1 {
    F1: Int;
}

struct DeepLevel2 {
    L1: DeepLevel1;
}

struct DeepLevel3 {
    L2: DeepLevel2;
}

contract TestDeepNested {
    receive() {
        let d: DeepLevel3 = DeepLevel3{ L2: DeepLevel2{ L1: DeepLevel1{ F1: 42 } } };
    }
}
