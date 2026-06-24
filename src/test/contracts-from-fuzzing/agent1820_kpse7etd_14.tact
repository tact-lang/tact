struct Levels {
    level1: Int;
    level2: Int?;
    level3: Bool;
    level4: Bool?;
    level5: Address;
    level6: Address?;
}

contract TestContract {
    data: Levels;
    init() {
        self.data = Levels{
            level1: 1,
            level2: null,
            level3: true,
            level4: null,
            level5: myAddress(),
            level6: null,
        };
    }
}