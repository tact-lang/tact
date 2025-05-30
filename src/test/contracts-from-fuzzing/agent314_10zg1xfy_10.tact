struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Bool?;
}

struct TopStruct {
    first: Inner1;
    second: Inner2;
}

contract TwoNestedStructs {
    field: TopStruct;
    init() {
        self.field = TopStruct{
            first: Inner1{a:1,b:true},
            second: Inner2{c:"x",d:null}
        };
    }
}