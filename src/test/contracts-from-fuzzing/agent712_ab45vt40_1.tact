struct NestedData {
    val1: Int;
    val2: Bool?;
}

contract TestContract {
    data: NestedData;

    init() {
        self.data = NestedData{
            val1: 10,
            val2: true,
        };
    }
}