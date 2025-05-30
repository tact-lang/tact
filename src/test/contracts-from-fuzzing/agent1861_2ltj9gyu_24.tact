struct Levels1 { x: Int; }
struct Levels2 { x: Levels1; }
struct Levels3 { x: Levels2; }
struct Levels4 { x: Levels3; }
struct Levels5 { x: Levels4; }
struct Levels6 { x: Levels5; }
struct Levels7 { x: Levels6; }
struct Levels8 { x: Levels7; }
contract Deep8 {
    data: Levels8;
    init() {
        self.data = Levels8{ x: Levels7{ x: Levels6{ x: Levels5{ x: Levels4{ x: Levels3{ x: Levels2{ x: Levels1{ x: 8 } } } } } } } };
    }
}