struct S1 {
    a: Int;
    b: Bool;
    c: Address;
}

struct S2 {
    x: S1;
    y: S1;
}

contract DupStructs {
    val: S2;

    init() {
        self.val = S2{
            x: S1{a:1,b:true,c:myAddress()},
            y: S1{a:2,b:false,c:myAddress()}
        };
    }
}