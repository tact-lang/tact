struct OptStructs {
    optA: LevelA?;
    optB: LevelB?;
}

struct LevelA {
    x: Int;
}

struct LevelB {
    y: Int;
}

contract OptStructsTest {
    data: OptStructs;

    init() {
        self.data = OptStructs{
            optA: null,
            optB: null
        };
    }
}