struct Level3 { x: Int; y: Int?; }
struct Level2 { child: Level3; extra: Int; }
struct Level1 { sub: Level2; flag: Bool; }

contract NestedOptional {
    data: Level1;
    init() {
        self.data = Level1{
            sub: Level2{
                child: Level3{ x: 1, y: null },
                extra: 7
            },
            flag: true
        };
    }
}