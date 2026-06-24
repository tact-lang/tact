struct Simple {
    value: Int;
}

struct Container {
    s: Simple;
    opt: Simple?;
    flag: Bool;
}

contract OptionalStructField {
    c: Container;

    init() {
        self.c = Container{
            s: Simple{ value: 5 },
            opt: null,
            flag: true
        };
    }
}