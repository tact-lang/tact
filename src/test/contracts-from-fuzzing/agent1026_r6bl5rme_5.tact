struct VeryDeep3 {
    val: Int;
}
struct VeryDeep2 {
    inner: VeryDeep3;
}
struct VeryDeep1 {
    inner: VeryDeep2;
}

contract ContractDeepNest {
    payload: VeryDeep1;

    init() {
        self.payload = VeryDeep1{
            inner: VeryDeep2{
                inner: VeryDeep3{
                    val: 123
                }
            }
        };
    }
}