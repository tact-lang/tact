struct BigNested {
    a: Nested1;
}

struct Nested1 {
    b: Nested2;
}

struct Nested2 {
    x: Int;
    y: Bool;
    z: Bool?;
}

contract TestContract(big: BigNested) {
    receive() {
        let _ = self.big;
    }
}