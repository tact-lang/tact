struct NestDepth3 {
    a: Int;
    b: Nest2;
}

struct Nest2 {
    x: Int;
    y: Nest1;
}

struct Nest1 {
    x: Int;
}

contract TestContract {
    s: NestDepth3;

    init() {
        self.s = NestDepth3{
            a: 1,
            b: Nest2{
                x: 2,
                y: Nest1{
                    x: 3,
                },
            },
        };
    }
}