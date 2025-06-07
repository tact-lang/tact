struct OuterMostOpt {
    innerOpt: MiddleOpt?;
}
struct MiddleOpt {
    inner: InnerMostOpt?;
}
struct InnerMostOpt {
    val: Int?;
}

contract DeepOptionLayers {
    f: OuterMostOpt = OuterMostOpt{ innerOpt: null };
    receive() {
        let _ = self.f.innerOpt;
    }
}