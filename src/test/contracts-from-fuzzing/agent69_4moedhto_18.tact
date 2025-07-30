struct DeepWithDefaults {
    a: Int = 1;
    b: LevelOneWithDef;
}

struct LevelOneWithDef {
    c: Int = 2;
    d: LevelTwoWithDef;
}

struct LevelTwoWithDef {
    e: String = "hello";
    f: Int = 42;
}

contract DeepWithDefaultsTest {
    data: DeepWithDefaults;
    init() {
        self.data = DeepWithDefaults{
            b: LevelOneWithDef{
                d: LevelTwoWithDef{}
            }
        };
    }
}