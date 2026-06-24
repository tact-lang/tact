struct OptInner {
    innerOpt: Int?;
}

struct HoldOpt {
    field: OptInner;
}

contract OptHolder {
    data: HoldOpt;

    init() {
        self.data = HoldOpt{
            field: OptInner{ innerOpt: null }
        };
    }
}
