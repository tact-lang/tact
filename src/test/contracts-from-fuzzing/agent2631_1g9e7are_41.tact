struct StrWithDefaultOpt {
    s: String? = null;
    i: Int;
}

contract StructOptDefaultNull {
    data: StrWithDefaultOpt;

    init() {
        self.data = StrWithDefaultOpt{s:null, i:10};
    }
}