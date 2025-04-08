// Deep composition of structs with default values
struct DefInner {
    val: Int = 7;
    txt: String = "x";
}

struct DefOuter {
    inner: DefInner;
    y: Int = 42;
}

contract DefaultDeep {
    data: DefOuter;
    init() {
        self.data = DefOuter{
            inner: DefInner{
                val: 5,
                txt: "foo",
            },
            y: 99,
        };
    }
}