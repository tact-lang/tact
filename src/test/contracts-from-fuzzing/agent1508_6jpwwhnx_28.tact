struct InnerDef {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

struct OuterOpt {
    inner: InnerDef?;
}

contract TestContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            inner: InnerDef{ b:true }   // omit 'a' and 'c', override 'b'
        };
    }
}