struct NestedOptionalsDeeper {
  innerOpt: Inner?;
}

struct Inner {
  nestedOpt: Int?;
}

contract ComplexOptionPattern {
    f: NestedOptionalsDeeper = NestedOptionalsDeeper{innerOpt: null};

    init() {
        self.f = NestedOptionalsDeeper{innerOpt: Inner{nestedOpt:null}};
    }

    receive() {
        let _ = self.f;
    }
}