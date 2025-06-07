struct InnerOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructInnerOptionals {
    foo: InnerOptionals;
    init() {
        self.foo = InnerOptionals{ a:null, b:null, c:null };
    }
}