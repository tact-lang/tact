struct Inner1 {
    a: Int = 1;
}
struct Inner2 {
    b: Int = 2;
    nested: Inner1;
}
struct Inner3 {
    c: Int = 3;
    nested: Inner2;
}
struct Root {
    d: Int = 4;
    nested: Inner3;
}
contract MultiNested {
    root: Root;
    init() {
        self.root = Root{
            d: 44,
            nested: Inner3{
                c: 33,
                nested: Inner2{
                    b: 22,
                    nested: Inner1{ a: 11 }
                }
            }
        };
    }
}