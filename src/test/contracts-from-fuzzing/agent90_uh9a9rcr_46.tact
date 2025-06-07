struct TupleLike {
    a: Int;
    b: Bool;
}

struct Container {
    t1: TupleLike;
    t2: TupleLike;
}

contract TupleFieldsContract {
    data: Container;
    init() {
        self.data = Container{
            t1: TupleLike{ a:1, b:true },
            t2: TupleLike{ a:2, b:false }
        };
    }
}