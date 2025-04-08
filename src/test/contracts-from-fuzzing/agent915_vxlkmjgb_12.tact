struct Sub {
    a: Int as uint8;
    b: Bool;
    c: Int?;
}

struct Main {
    foo: Int;
    bar: Sub;
    buz: Int?;
}

contract SerializeDifferent {
    content: Main;
    init() {
        self.content = Main{
            foo: 42,
            bar: Sub{ a: 255, b: true, c: null },
            buz: null
        };
    }
}
