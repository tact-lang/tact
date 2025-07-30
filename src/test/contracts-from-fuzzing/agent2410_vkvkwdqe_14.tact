struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    inner: S1;
    opt: Int?;
    text: String;
}

contract StructsInFields {
    data: S2;

    init() {
        self.data = S2{
            inner: S1{a:1,b:true},
            opt: null,
            text:"hi",
        };
    }
}