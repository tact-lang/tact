struct InnerA { a: Int; }
struct InnerB { b: Bool; }
struct InnerC { c: String; }

struct Agg {
    first: InnerA;
    second: InnerB;
    third: InnerC;
}

contract NestedAgg {
    data: Agg;

    init() {
        self.data = Agg{
            first: InnerA{ a:1 },
            second: InnerB{ b:true },
            third: InnerC{ c:"ok" }
        };
    }
}