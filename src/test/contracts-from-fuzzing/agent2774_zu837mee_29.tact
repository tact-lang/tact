// struct with mixture of explicit integers and booleans
struct Mix {
    a: Int as uint32;
    b: Bool;
    c: Int as int64;
    d: Bool;
    e: Int;
}

contract TestContract {
    v: Mix;

    init() {
        self.v = Mix{
            a: 100,
            b: false,
            c: 9999,
            d: true,
            e: -42
        };
    }
}