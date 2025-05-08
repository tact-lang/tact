struct SingleOpt {
    a: Int?;
}

struct Container {
    b: SingleOpt?;
}

contract OptOptField {
    data: Container;

    init() {
        self.data = Container{
            b: null,
        };
    }
}