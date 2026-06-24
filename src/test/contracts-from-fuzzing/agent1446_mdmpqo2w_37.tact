struct Lvl3 {
    foo: Int?;
    bar: Bool;
}

struct Lvl2 {
    inner: Lvl3;
    maybe: String?;
}

contract Deep {
    level2: Lvl2;
    init() {
        self.level2 = Lvl2{
            inner: Lvl3{ foo:null, bar:true },
            maybe: "hi"
        };
    }
}
