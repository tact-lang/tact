struct InnerMostOpt {
    v: Int?;
}
struct MiddleOpt {
    inner: InnerMostOpt;
}
contract OptionInDeepStruct {
    f: MiddleOpt = MiddleOpt{ inner: InnerMostOpt{ v: null } };
    receive() {
        let _ = self.f.inner.v;
    }
}