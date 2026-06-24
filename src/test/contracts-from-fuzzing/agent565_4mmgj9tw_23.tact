struct SInner { s: String; }
struct SOuter { inner: SInner; s2: String; }

contract StringNest {
    nest: SOuter;
    init() {
        self.nest = SOuter{
            inner: SInner{ s: "foo" },
            s2: "bar",
        };
    }
}