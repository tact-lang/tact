struct InnerA { fieldA: Int; }
struct InnerB { inA: InnerA; val: Int; }
struct InnerC { inB: InnerB; flag: Bool; }

contract DeepChainStorage {
    val: InnerC;

    init() {
        self.val = InnerC {
            inB: InnerB {
                inA: InnerA { fieldA: 123 },
                val: 456
            },
            flag: true
        };
    }
}