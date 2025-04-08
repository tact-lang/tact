struct NestInner {
    z: Int;
    y: Bool;
    x: String;
}

struct Nested {
    a: Int;
    b: NestInner;
    c: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            a: 1,
            b: NestInner{
                z: 2,
                y: true,
                x: "hello"
            },
            c: false
        };
    }
}