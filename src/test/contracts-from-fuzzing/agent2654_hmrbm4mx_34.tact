struct Inner1 { x: Int; }
struct Inner2 { y: Int; }
struct InnerWrap {
    a: Inner1;
    b: Inner2;
}
struct OuterWrap {
    iw: InnerWrap;
}

contract MultipleNestedStructs {
    outer: OuterWrap;

    init() {
        self.outer = OuterWrap{
            iw: InnerWrap{
                a: Inner1{x:1},
                b: Inner2{y:2}
            }
        };
    }
}