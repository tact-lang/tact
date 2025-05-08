struct InnerDeep { s: String? }
struct InnerMid { deep: InnerDeep? }

struct OuterWide {
    a: Int;
    mid: InnerMid?;
    b: String;
    c: Bool?;
}

contract NestedOptionals {
    val: OuterWide;

    init() {
        self.val = OuterWide{
            a: 5,
            mid: null,
            b: "ok",
            c: null,
        };
    }
}

contract Dummy { receive(){} }