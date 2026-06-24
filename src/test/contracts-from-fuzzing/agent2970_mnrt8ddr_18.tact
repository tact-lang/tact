// contract with no parameters and implicit init, deep nested optional

struct Level3 {
    foo: Int?;
}

struct Level2 {
    bar: Level3?;
}

struct Level1 {
    baz: Level2?;
}

contract TestContract {
    q: Level1;

    init() {
        self.q = Level1{ baz: null };
    }
}