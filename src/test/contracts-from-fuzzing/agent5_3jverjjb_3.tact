struct DeepLevel3 { val3: Int }
struct DeepLevel2 { l3: DeepLevel3 }
struct DeepLevel1 { l2: DeepLevel2 }

contract DeepTest {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{ l2: DeepLevel2{ l3: DeepLevel3{ val3: 10 } } };
    }

    receive() {
        let _ = self.deep;
    }
}