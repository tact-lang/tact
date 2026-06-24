struct S1 {
    n: Int;
    s: String;
}

struct S2 {
    b: Bool;
    addr: Address;
}

struct Compose {
    x: S1;
    y: S2;
    opt: S1?;
}

contract NestedFields {
    data: Compose;

    init() {
        self.data = Compose{
            x: S1{n:1,s:"one"},
            y: S2{b:true,addr:myAddress()},
            opt: null
        };
    }
}