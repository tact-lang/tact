struct Nested1 {
    val1: Int;
}

struct Nested2 {
    inner: Nested1;
    val2: Int;
}

struct Nested3 {
    layer: Nested2;
    val3: Int;
}

contract DeepStorage {
    deep: Nested3;
    init() {
        self.deep = Nested3{
            layer: Nested2{inner: Nested1{val1:11}, val2:22},
            val3: 33
        };
    }
}