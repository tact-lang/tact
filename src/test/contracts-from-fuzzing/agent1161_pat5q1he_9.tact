struct Levels3 {
    foo: Int;
}

struct Levels2 {
    lvl3: Levels3;
}

struct Levels1 {
    lvl2: Levels2;
}

contract MultiLevels {
    storage: Levels1;

    init() {
        self.storage = Levels1{ lvl2: Levels2{ lvl3: Levels3{ foo: 9 } } };
    }
}