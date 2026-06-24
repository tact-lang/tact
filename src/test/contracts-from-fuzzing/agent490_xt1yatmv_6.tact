struct Inner1 { a: Int; }
struct Inner2 { b: Int; inner1: Inner1; }
struct TopStruct { c: Int; inner2: Inner2; }

contract TestContract {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            c:123,
            inner2: Inner2{
                b:456,
                inner1: Inner1{
                    a:789
                }
            }
        };
    }
}