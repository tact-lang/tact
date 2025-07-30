// Struct nested with default inner
struct InnerDefault {
    num: Int = 5;
    txt: String = "ok";
}

struct OuterWrap {
    inside: InnerDefault;
}

contract StructInnerDefault {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{ inside: InnerDefault{} };
    }
}
