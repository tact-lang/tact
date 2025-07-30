struct MultiLevel {
    a: Int;
    b: Holder;
}

struct Holder {
    x: Int;
    y: String;
}

contract StructWithStructWithString {
    val: MultiLevel;
    init() {
        self.val = MultiLevel{
            a:1,
            b: Holder{ x:2, y:"ok" }
        };
    }
}