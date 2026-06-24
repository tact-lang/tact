struct Level3 {
    x: Int;
}

struct Level2 {
    a: Int?;
    b: Level3;
}

struct Level1 {
    foo: Level2?;
    bar: Bool;
}

contract NestedDeep {
    state: Level1;

    init() {
        self.state = Level1{
            foo: null,
            bar: false
        };
    }

    receive() {
        if (self.state.foo != null) {
            let _ = self.state.foo!!.b.x;
        }
    }
}