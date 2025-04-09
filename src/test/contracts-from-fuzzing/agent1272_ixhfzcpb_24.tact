struct Layer3 {
    val3: Int;
}
struct Layer2 {
    val2: Layer3;
}
struct Layer1 {
    val1: Layer2;
}

contract NestedLayers {
    f: Layer1;
    init() {
        self.f = Layer1{
            val1: Layer2{
                val2: Layer3{
                    val3: 55
                }
            }
        };
    }
}
