struct InnerData {
    x: Int;
}

struct OuterData {
    y: Int;
    inner: InnerData;
}

contract StructOutside {
    val: OuterData;
    init() {
        self.val = OuterData{
            y:10,
            inner: InnerData{ x: 5 }
        };
    }
}