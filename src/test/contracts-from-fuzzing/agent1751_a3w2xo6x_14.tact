struct MultiLayerDefaults {
    a: Int = 1;
    b: Int = 2;
    inner: InnerDefault;
}

struct InnerDefault {
    x: Int = 3;
    y: Int = 4;
    flag: Bool = false;
}

contract MultiLayerDefaultsContract {
    m: MultiLayerDefaults;

    init() {
        self.m = MultiLayerDefaults{
            inner: InnerDefault{}
        };
    }
}
