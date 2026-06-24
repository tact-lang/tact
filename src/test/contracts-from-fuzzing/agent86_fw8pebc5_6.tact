struct Level3 { z: Int; }
struct Level2 { y: Int; nestedLevel3: Level3; optStr: String?; }
struct Level1 { x: Int; nestedLevel2: Level2; flag: Bool; optAddr: Address?; }

contract ComplexNested {
    data: Level1;

    init() {
        self.data = Level1{
            x: 10,
            nestedLevel2: Level2{
                y: 20,
                nestedLevel3: Level3{
                    z: 30
                },
                optStr: null,
            },
            flag: true,
            optAddr: null,
        };
    }
}