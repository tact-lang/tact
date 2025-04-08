struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    x: String;
    y: Level3?;
}

struct Level1 {
    foo: Address;
    bar: Level2;
    baz: Level2?;
}

contract NestedContract {
    state: Level1;

    init() {
        self.state = Level1{
            foo: myAddress(),
            bar: Level2{
                x: "hello",
                y: null,
            },
            baz: null
        };
    }

    receive() {}
}
