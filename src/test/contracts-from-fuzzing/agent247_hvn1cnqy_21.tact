struct S1 {
    f: Int;
}
struct S2 {
    s: S1;
    opt: S1?;
}
struct S3 {
    s: S2;
}
contract OptionalNestedDeep {
    foo: S3;
    init() {
        self.foo = S3{
            s: S2{
                s:S1{f:1},
                opt:null
            }
        };
    }
}