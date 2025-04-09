struct Flat {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Nested {
    d: Flat;
    e: Flat;
    f: Flat;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{
            d: Flat{ a:1, b:true, c:null },
            e: Flat{ a:2, b:false, c:3 },
            f: Flat{ a:4, b:true, c:null },
        };
    }
}