struct Sub {
    val: Int;
}

struct HasManyOpts {
    a: Sub?;
    b: Sub?;
    c: Sub?;
}

contract TestContract {
    data: HasManyOpts;

    init() {
        self.data = HasManyOpts{
            a: Sub{val:1},
            b: null,
            c: Sub{val:3},
        };
    }
}