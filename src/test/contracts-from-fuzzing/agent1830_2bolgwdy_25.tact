struct MultiLayerDefaults {
    a: Int = 1;
    b: InnerDefault;
}

struct InnerDefault {
    c: Int = 2;
    d: Bool = true;
}

contract TestContract {
    data: MultiLayerDefaults;

    init() {
        self.data = MultiLayerDefaults{
            a:1,
            b:InnerDefault{ c:2, d:true }
        };
    }
}
