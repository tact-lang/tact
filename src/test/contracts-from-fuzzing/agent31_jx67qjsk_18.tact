struct Inner {
    data: Int;
}

struct Outer {
    inner: map<Int, Inner>;
}

contract Test {
    s: map<Address, Outer>;

    init() {
        self.s = emptyMap();
    }

    receive() {
        let sender: Address = context().sender;
        let innerMap: map<Int, Inner> = emptyMap();
        innerMap.set(1, Inner { data: 42 });
        let o: Outer = Outer { inner: innerMap };
        self.s.set(sender, o);
        
        let oOpt: Outer? = self.s.get(sender);
        if (oOpt != null) {
            let oVal: Outer = oOpt!!;
            let innerOpt: Inner? = oVal.inner.get(1);
            if (innerOpt != null) {
                let innerVal: Inner = innerOpt!!;
                if (innerVal.data == 42) {
                    dump(1);
                } else {
                    dump(0);
                }
            } else {
                dump(0);
            }
        } else {
            dump(0);
        }
    }
}
