struct InnerMost {
    v: Int;
}
struct Inner {
    inn: InnerMost;
}
struct Outer {
    inr: Inner;
}
contract DeeplyNested {
    root: Outer;
    init() {
        self.root = Outer{ inr: Inner{ inn: InnerMost{ v: 5 } } };
    }
}