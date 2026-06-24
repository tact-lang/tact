struct ManyOptionalBools {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
    f7: Bool?;
}

contract ManyOptionalBoolsTest {
    data: ManyOptionalBools;

    init() {
        self.data = ManyOptionalBools{};
    }
}