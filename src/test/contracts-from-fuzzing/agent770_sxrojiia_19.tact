struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    f1: Optionals;
    f2: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            f1: Optionals{
                a: null,
                b: null,
                c: null
            },
            f2: true
        };
    }
}