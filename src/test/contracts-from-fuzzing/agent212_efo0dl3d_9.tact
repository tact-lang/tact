struct Layer3 {
    a: Int;
}

struct Layer2 {
    inner: Layer3;
    innerOpt: Layer3?;
}

struct Layer1 {
    a: Layer2;
    b: Layer2?;
}

contract TestContract {
    field: Layer1;

    init() {
        self.field = Layer1{
            a: Layer2{
                inner: Layer3{ a:1 },
                innerOpt: null,
            },
            b: null,
        };
    }
}