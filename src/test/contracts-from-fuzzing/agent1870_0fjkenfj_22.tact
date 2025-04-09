struct NestedOptLevels {
    inn: InnerOptLevel?;
}

struct InnerOptLevel {
    val: Int?;
}

contract MultiLayerOptional {
    data: NestedOptLevels;

    init() {
        self.data = NestedOptLevels {
            inn: InnerOptLevel { val: null }
        };
    }
}
