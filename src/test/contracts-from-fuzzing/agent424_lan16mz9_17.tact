struct Chain1 {
    a: Int;
    next: Chain2?;
}

struct Chain2 {
    b: Int;
    next: Chain3?;
}

struct Chain3 {
    c: Bool;
}

contract LinkedOptional {
    root: Chain1;

    init() {
        self.root = Chain1{
            a: 1,
            next: Chain2{
                b: 2,
                next: Chain3{c:true},
            }
        };
    }
}