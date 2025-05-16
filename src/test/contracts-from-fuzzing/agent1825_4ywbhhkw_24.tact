struct NestedStringOpt {
    field: String?;
}

struct WrapNestedOpt {
    inner: NestedStringOpt;
}

contract OptDeepStr {
    rec: WrapNestedOpt;
    init() {
        self.rec = WrapNestedOpt{ inner: NestedStringOpt{field:null} };
    }
}
