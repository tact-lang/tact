struct InnerA { fa: Int }
struct InnerB { fb: Bool }
struct C {
    a: InnerA?;
    b: InnerB?;
}

contract NestedOptionals {
    data: C;

    init() {
        self.data = C{
            a: null,
            b: InnerB{fb:true}
        };
    }
}
