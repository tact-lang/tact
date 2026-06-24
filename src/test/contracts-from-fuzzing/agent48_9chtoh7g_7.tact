struct Deep {
    innerOpt: Inner?;
    flag: Bool = false;
}

struct Inner {
    x: Int = 1;
    y: String?;
}

contract TestContract {
    deepOpt: Deep?;

    init() {
        self.deepOpt = Deep{ innerOpt: Inner{ x: 999, y: "x" }, flag: true };
    }
}
