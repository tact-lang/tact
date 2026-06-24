struct Deep3 {
    dval: Int;
}

struct Mid2 {
    inner: Deep3;
}

struct Top1 {
    middle: Mid2;
}

contract TestContract {
    top: Top1;

    init() {
        self.top = Top1{
            middle: Mid2{
                inner: Deep3{
                    dval: 777,
                },
            },
        };
    }
}
