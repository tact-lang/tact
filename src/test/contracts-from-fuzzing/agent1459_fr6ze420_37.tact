// contract field optional with deeply nested optional serialized int
struct SNest {
    val: Int? as uint32;
}

struct SOuter2 {
    inner: SNest?;
}

contract DeepNestedSerializeOpt {
    s: SOuter2?;

    init() {
        self.s = null;
    }
}