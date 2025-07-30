struct InnerOpt { foo: Int?; }
struct WrapOpt { inner: InnerOpt?; }

contract OptInOptStruct {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{ inner: null };
    }
}