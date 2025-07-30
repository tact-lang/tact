struct Sub1 {
    a: Int as uint8;
}

struct Sub2 {
    b: Int as int16;
}

struct Container {
    s1: Sub1;
    s2: Sub2;
}

contract SerializationNestIssue {
    content: Container;

    init() {
        self.content = Container{
            s1: Sub1{ a: 5 },
            s2: Sub2{ b: -5 },
        };
    }

    receive() {
        let _ = self.content;
    }
}