struct Nested {
    n1: Int;
    n2: Int?;
}

struct Envelope {
    e1: Bool;
    e2: Int;
    e3: Nested;
}

contract StorageTest {
    data: Envelope;

    init() {
        self.data = Envelope{
            e1: true,
            e2: 10,
            e3: Nested{
                n1: 5,
                n2: null,
            },
        };
    }
    
    receive() {}
}