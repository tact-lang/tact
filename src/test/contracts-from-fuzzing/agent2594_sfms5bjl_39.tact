struct A {
    s: Int;
    sub: B;
}

struct B {
    sb: Int?;
    inner: C;
}

struct C {
    flag: Bool;
    text: String?;
}

contract DeepFields {
    base: A;
    init() {
        self.base = A{
            s:1,
            sub:B{
               sb:null,
               inner:C{flag:true, text:null}
            }
        };
    }
}