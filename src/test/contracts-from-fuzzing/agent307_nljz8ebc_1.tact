struct Nested {
    a: Int;
    b: Int?;
    c: Deep;
}

struct Deep {
    d: Bool;
    e: Inner;
}

struct Inner {
    flag: Bool?;
    count: Int;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            a: 10,
            b: null,
            c: Deep{
                d: true,
                e: Inner{
                    flag: false,
                    count: 5,
                },
            },
        };
    }
}