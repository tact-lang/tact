struct MultiNested {
    aa: Int;
    bb: Bool;
    cc: Nested;
}

struct Nested {
    s: String;
    inn: Inner;
}

struct Inner {
    n: Int?;
}

contract TestContract {
    m: MultiNested;

    init() {
        self.m = MultiNested{
            aa: 5,
            bb: true,
            cc: Nested{
                s: "ok",
                inn: Inner{n:null}
            }
        };
    }
}