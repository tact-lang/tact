struct InnerLevel3 { z: Int }

struct InnerLevel2 { sub: InnerLevel3 }

struct InnerLevel1 { sub: InnerLevel2 }

contract DeepNestTest {
    deep: InnerLevel1;

    init() {
        self.deep = InnerLevel1{ sub: InnerLevel2{ sub: InnerLevel3{ z: 99 } } };
    }
}