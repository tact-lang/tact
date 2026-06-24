struct LevelThree { a: Int; b: Int?; }
struct LevelTwo { lt: LevelThree; c: Bool; d: String?; }
struct LevelOne { l2: LevelTwo; e: Bool?; f: String; }

contract NestedStorage {
    nested: LevelOne;
    
    init() {
        self.nested = LevelOne{
            l2: LevelTwo{
                lt: LevelThree{ a: 1, b: null },
                c: true,
                d: null
            },
            e: null,
            f: "test"
        };
    }
}