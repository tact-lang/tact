struct Container {
    intOpt: Int?;
    boolOpt: Bool?;
    nestedOpt: Nested?;
}

struct Nested {
    val: Int;
    flag: Bool;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            intOpt: 7,
            boolOpt: null,
            nestedOpt: Nested{
                val: 42,
                flag: false,
            },
        };
    }
}