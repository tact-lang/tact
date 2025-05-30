struct DeepLayer3 {
    val: Int;
    text: String;
}

struct DeepLayer2 {
    inner: DeepLayer3;
    flag: Bool;
}

struct DeepLayer1 {
    inner: DeepLayer2;
    addr: Address;
}

contract DeepNestContract {
    data: DeepLayer1;

    init() {
        self.data = DeepLayer1{
            inner: DeepLayer2{
                inner: DeepLayer3{
                    val: 123,
                    text: "deep"
                },
                flag: true
            },
            addr: myAddress()
        };
    }
}
