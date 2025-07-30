struct SInner { foo:Int }
struct SOuter { inner: SInner }
contract MultiOpt {
    v1: Int?;
    v2: Bool?;
    v3: Cell?;
    v4: Slice?;
    s: SOuter?;

    init() {
        self.v1 = null;
        self.v2 = null;
        self.v3 = null;
        self.v4 = null;
        self.s = null;
    }
}