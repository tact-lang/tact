struct Level3 { x: Int; y: Int; }
struct Level2 { inner: Level3; z: Bool; }
struct Level1 { nested: Level2; flag: Bool; }

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{ x: 1, y: 2 },
                z: true
            },
            flag: false
        };
    }
}