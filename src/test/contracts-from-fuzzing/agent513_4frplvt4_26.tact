struct One {
    a: Int;
    b: Bool;
    c: String;
}

struct Two {
    x: Address;
    y: Cell;
    z: Slice;
}

struct Container {
    one: One;
    two: Two;
}

contract Test {
    c: Container;
    init() {
        self.c = Container{
            one: One{ a:1, b:true, c:"hi" },
            two: Two{ x:myAddress(), y:emptyCell(), z:emptyCell().asSlice() }
        };
    }
    receive() {}
}