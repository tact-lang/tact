struct InnerData {
    val: Int;
}

struct MiddleData {
    rec: InnerData?;
}

contract NestedOptionalStructField {
    stuff: MiddleData?;

    init() {
        self.stuff = null;
    }
}