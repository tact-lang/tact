struct InnerA { x: Int }
struct InnerB { y: Bool }
struct Container {
    a: InnerA;
    b: InnerB;
    z: String;
}

contract MultiNested {
    val: Container;

    init() {
        self.val = Container{
            a: InnerA{ x: 99 },
            b: InnerB{ y: true },
            z: "hello"
        };
    }
}