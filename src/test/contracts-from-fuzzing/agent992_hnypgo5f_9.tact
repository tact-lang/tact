struct Outer {
    nested1: Inner1;
    nested2: Inner2;
}

struct Inner1 {
    flag: Bool;
    val: Int?;
}

struct Inner2 {
    msg: String;
    opt: String?;
}

contract TestContract {
    complex: Outer;
    init() {
        self.complex = Outer{
            nested1: Inner1{flag:true, val:null},
            nested2: Inner2{msg:"ok", opt:"maybe"}
        };
    }
}
