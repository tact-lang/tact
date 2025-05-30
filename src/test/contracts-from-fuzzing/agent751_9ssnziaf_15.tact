struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }

struct Aggregate {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
}

contract AggregateFields {
    val: Aggregate;

    init() {
        self.val = Aggregate{
            f1: Inner1{ a: 1 },
            f2: Inner2{ b: 2 },
            f3: Inner3{ c: 3 },
        };
    }
}