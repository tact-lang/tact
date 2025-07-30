struct Sub {
    s: String;
}

struct Container {
    a: Int;
    b: Sub;
    c: Int;
    d: Sub;
}

contract RepeatStructType {
    storage: Container;

    init() {
        self.storage = Container{
            a: 100,
            b: Sub{ s: "x" },
            c: 200,
            d: Sub{ s: "y" }
        };
    }
}