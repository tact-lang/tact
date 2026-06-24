struct DeepLevel3 { m: Int; }

struct DeepLevel2 { n: DeepLevel3; }

struct DeepLevel1 { o: DeepLevel2; }

contract TestContract {
    deepField: DeepLevel1;

    init() {
        self.deepField = DeepLevel1{ o: DeepLevel2{ n: DeepLevel3{ m: 999 } } };
    }
}