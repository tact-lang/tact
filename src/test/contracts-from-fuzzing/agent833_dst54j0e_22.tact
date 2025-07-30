// Deep chain, one optional inside another optional (single level)
struct Layer1 {
    optLayer2: Layer2?;
}

struct Layer2 {
    optLayer3: Layer3?;
}

struct Layer3 {
    val: Int = 123;
}

contract TestContract {
    chain: Layer1;

    init() {
        self.chain = Layer1{
            optLayer2: Layer2{
                optLayer3: Layer3{
                    val: 17
                }
            }
        };
    }
}
