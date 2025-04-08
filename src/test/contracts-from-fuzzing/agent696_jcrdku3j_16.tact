struct Level3 { v: Int }

struct Level2 { x: Level3 }

struct Level1 { y: Level2 }

struct Container {
    nested: Level1;
    optNested: Level1?;
    txt: String;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nested: Level1{ y: Level2{ x: Level3{ v: 42 } } },
            optNested: null,
            txt: "test"
        };
    }
}