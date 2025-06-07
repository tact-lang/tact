struct Level3 {
    z: Int?;
}
struct Level2 {
    y: Level3;
}
struct Level1 {
    x: Level2;
}

struct Container {
    a: Int;
    nested: Level1;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            a: 99,
            nested: Level1 { x: Level2 { y: Level3 { z: null } } }
        };
    }
}