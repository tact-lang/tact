struct Layered {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    m: String;
    n: Address;
}

contract MultipleInnerStructs {
    field: Layered;

    init() {
        self.field = Layered{
            a:1,
            b: Inner1{x:2, y:true},
            c: Inner2{m:"xx", n:myAddress()}
        };
    }
}