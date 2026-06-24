struct Sub {
    a: Int;
    b: Int?;
}

struct Wrap {
    s: Sub;
    x: Bool?;
}

contract CombineOptionals {
    f: Wrap;

    init() {
        self.f = Wrap{
            s: Sub{ a:5, b:null },
            x: false
        };
    }
}