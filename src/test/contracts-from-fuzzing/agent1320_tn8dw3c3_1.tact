struct DeepNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    x: Int;
    y: Bool;
}

contract NestTest {
    data: DeepNested = DeepNested{ inner1: Inner1{ inner2: Inner2{ x: 1, y: true } } };

    receive() {
        self.data = DeepNested{ inner1: Inner1{ inner2: Inner2{ x: 2, y: false } } };
    }
}