struct Levels1 { s: String; }
struct Levels2 { s: Levels1; }
struct Levels3 { s: Levels2; }
struct Levels4 { s: Levels3; }
struct Levels5 { s: Levels4; }

contract Deep5 {
    nested: Levels5;

    init() {
        self.nested = Levels5{ s: Levels4{ s: Levels3{ s: Levels2{ s: Levels1{ s: "deep" } } } } };
    }
}
