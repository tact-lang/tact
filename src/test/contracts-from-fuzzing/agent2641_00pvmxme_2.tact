struct A {
    x: Int;
    y: Bool;
    z: String;
    w: Cell;
}

contract MixedTypes {
    data: A;

    init() {
        self.data = A{
            x: 42,
            y: true,
            z: "hello",
            w: emptyCell(),
        };
    }
}