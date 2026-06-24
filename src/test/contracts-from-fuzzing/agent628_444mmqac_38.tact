struct SOptInt {
    inner: Int?;
}

contract ContractWithOptionalStructInner {
    so: SOptInt;

    init() {
        self.so = SOptInt{ inner:null };
    }
}