struct S1 { a: Int; }
struct S2 { b: Int; inner: S1; }
struct S3 { c: Int; inner2: S2; }

contract TestContract {
    thing: S3;

    init() {
        self.thing = S3{
            c:100,
            inner2:S2{b:50, inner:S1{a:25}}
        };
    }
}