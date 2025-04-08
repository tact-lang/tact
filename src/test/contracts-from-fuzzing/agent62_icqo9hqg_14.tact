struct Inner1 { f1: Int; f2: Int?; }
struct Inner2 { f3: String; f4: Bool; }
struct Outer {
    i1: Inner1;
    i2: Inner2;
    f5: Bool?;
}

contract ManyNestOpt {
    field: Outer;
    init() {
        self.field = Outer{
            i1: Inner1{ f1: 1, f2: null },
            i2: Inner2{ f3: "abc", f4: true },
            f5: null
        };
    }
}