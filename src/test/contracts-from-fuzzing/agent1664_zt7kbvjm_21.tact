struct InnerData {
    val: Int;
}

struct MiddleData {
    rec: InnerData?;
}

contract NestedOptionalStructAssigned {
    stuff: MiddleData?;

    init() {
        self.stuff = MiddleData{
            rec: InnerData{ val: 123 }
        };
    }
}