struct Level3 { deep: Int; }
struct Level2 { inner: Level3; flag: Bool; }
struct Level1 { nested: Level2; txt: String; }

contract TestContract {
    data: Level1;
    init() {
        self.data = Level1{
            nested: Level2{ inner: Level3{ deep: 100 }, flag: true },
            txt: "deep nesting"
        };
    }
}