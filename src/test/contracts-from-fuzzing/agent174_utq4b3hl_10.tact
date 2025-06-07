struct Level4 { f: String; }
struct Level3 { next: Level4; }
struct Level2 { next: Level3; }
struct Level1 { next: Level2; }

contract DeepString {
    data: Level1;

    init() {
        self.data = Level1{ next: Level2{ next: Level3{ next: Level4{ f: "deep" } } } };
    }
}