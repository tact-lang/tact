struct OptionalsNested {
    inner: OptInner;
    another: OptInner;
}

struct OptInner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    sn: OptionalsNested;

    init() {
        self.sn = OptionalsNested{
            inner: OptInner{ x: null, y: null, z: null },
            another: OptInner{ x: null, y: null, z: null },
        };
    }
}