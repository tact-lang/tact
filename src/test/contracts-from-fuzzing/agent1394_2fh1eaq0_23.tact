struct InnerData {
    data: String;
}

struct OuterData {
    in1: InnerData;
    in2: InnerData;
}

contract DoubleNested {
    content: OuterData;

    init() {
        self.content = OuterData{
            in1: InnerData{data: "abc"},
            in2: InnerData{data: "def"}
        };
    }
}