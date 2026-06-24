struct InnerWithMany {
    a: Int;
    b: Int;
    c: String;
    d: Bool;
    e: Address;
}

struct OuterHasInner {
    field: InnerWithMany;
}

contract NestedMixes {
    wrapper: OuterHasInner;

    init() {
        self.wrapper = OuterHasInner{
            field: InnerWithMany{
                a: 1,
                b: 2,
                c: "abc",
                d: true,
                e: myAddress()
            }
        };
    }
}