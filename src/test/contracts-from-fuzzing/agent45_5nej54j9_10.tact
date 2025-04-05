struct Inner {
    a: Int;
}

struct Outer {
    opt: Inner?;
}

contract TestContract {
    receive() {
        let o = Outer{ opt: Inner{ a: 99 } };
        if (o.opt != null) {
            let inner_val: Inner = o.opt!!;
            inner_val.a;
        } else {
            0;
        }
    }
}
