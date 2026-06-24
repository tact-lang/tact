struct A {
    x: Int;
}

struct B {
    y: Int;
    za: A?;
}

struct C {
    zb: B?;
    flag: Bool;
}

contract OptionalChain {
    nested: C = C{zb:null, flag:true};

    receive() {
        if (self.nested.zb != null) {
            let b = self.nested.zb!!;
            if (b.za != null) {
                let a = b.za!!;
                let _ = a.x;
            }
        }
    }
}