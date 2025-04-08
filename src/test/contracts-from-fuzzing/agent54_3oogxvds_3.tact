struct Nested {
    val: Int;
    optVal: Int?;
    innerMap: map<Int, Int>;
}

contract Deep {
    nestedMap: map<Int, Nested>;
    init() {
        self.nestedMap = emptyMap();
    }
}