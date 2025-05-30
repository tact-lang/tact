struct Inside {
    i: Int as int64;
    j: Int?;
    k: Bool;
}

struct Outer {
    nested: Inside;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inside{ i: 123, j: null, k: true },
            flag: false
        };
    }
}