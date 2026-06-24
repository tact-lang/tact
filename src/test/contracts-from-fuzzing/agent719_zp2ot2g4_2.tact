struct Level2 {
    foo: Int;
}

struct Level1 {
    bar: Level2;
    baz: String;
}

contract TestContract {
    data: Level1;
    init() {
        self.data = Level1{ bar: Level2{foo: 42}, baz: "hello" };
    }
}