struct Levels1 { lvl2: Levels2 }
struct Levels2 { lvl3: Levels3 }
struct Levels3 { lvl4: Levels4 }
struct Levels4 { level: Int }

contract Test {
    data: Levels1;
    init() {
        self.data = Levels1{ lvl2: Levels2{ lvl3: Levels3{ lvl4: Levels4{ level: 999 } } } };
    }
}
