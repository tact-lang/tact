// Contract, top-level optionals and nested mixed
struct Inner {
    x: Int;
    y: String;
}

struct IOpt {
    foo: Inner?;
    bar: Int?;
}

contract TopOpt {
    first: Inner?;
    second: IOpt;

    init() {
        self.first = null;
        self.second = IOpt{
            foo: null,
            bar: null,
        };
    }
}