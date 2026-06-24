struct Inner {
    x: Int;
}

struct Root {
    field1: Int;
    field2: Inner;
    field3: Inner;
    field4: Int;
    field5: Bool;
}

contract ManyEmbeds {
    data: Root;
    init() {
        self.data = Root{
            field1: 1,
            field2: Inner{ x: 2 },
            field3: Inner{ x: 3 },
            field4: 4,
            field5: true,
        };
    }
}