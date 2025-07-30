struct ComplexOptions {
    i: Int?;
    s: String?;
    nested: NestedOpt?;
}

struct NestedOpt {
    flag: Bool?;
    addr: Address?;
    inner2: InnerDeep?;
}

struct InnerDeep {
    val: Int;
}

contract ComplexOptContract {
    data: ComplexOptions;

    init() {
        self.data = ComplexOptions{
            i:null,s:null,nested:NestedOpt{flag:null,addr:null,inner2:InnerDeep{val:123}}
        };
    }
}
