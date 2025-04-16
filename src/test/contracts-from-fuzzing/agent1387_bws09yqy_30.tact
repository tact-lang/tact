struct Level2 { f1: Int; f2: Bool }
struct Level1 { n1: Level2 }

contract NestStructs {
    store: Level1;

    init() {
        self.store = Level1{ n1: Level2{ f1: 5, f2: true } };
    }
}