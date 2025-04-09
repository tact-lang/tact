struct DeepNested {
    level1: Int;
    level2: Int;
    level3: Int;
    level4: Int;
    level5: Int;
    level6: Int;
    level7: Int;
    level8: Int;
    level9: Int;
    level10: Int;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level1: 1, level2: 2, level3: 3, level4: 4, level5: 5,
            level6: 6, level7: 7, level8: 8, level9: 9, level10: 10
        };
    }

    receive() {
        self.nested.level5 = 123;
    }
}