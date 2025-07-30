struct OptionStructs {
    a: WrapAddr?;
    b: WrapInt?;
    c: WrapBool?;
    d: WrapString?;
}

struct WrapAddr { a: Address; }
struct WrapInt { i: Int; }
struct WrapBool { b: Bool; }
struct WrapString { s: String; }

contract OptNestedStructs {
    val: OptionStructs;

    init() {
        self.val = OptionStructs{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}