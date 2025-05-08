struct InnerOpt {
    opt: Int?;
    fixed: Int;
}

struct OuterOpt {
    inner: InnerOpt;
    flag: Bool;
}

contract TestOptionalNested {
    receive() {
         let o: OuterOpt = OuterOpt { inner: InnerOpt { opt: null, fixed: 42 }, flag: true };
         if (o.flag) {
             o.inner.fixed;
         } else {
             0;
         }
    }
}
