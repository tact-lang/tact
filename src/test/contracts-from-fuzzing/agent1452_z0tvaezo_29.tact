struct LayerA {
    val: Int;
}

struct LayerB {
    val: LayerA;
}

struct LayerC {
    val: LayerB;
}

contract ChainStorage {
    data: LayerC;

    init() {
        self.data = LayerC{
            val: LayerB{
                val: LayerA{val: 123}
            }
        };
    }
}