struct Level3 { x: Int; }
struct Level2 { inner: Level3; flag: Bool; }
struct Level1 { nested: Level2; label: String; }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{ x: 5 },
                flag: true
            },
            label: "deep"
        };
    }
}