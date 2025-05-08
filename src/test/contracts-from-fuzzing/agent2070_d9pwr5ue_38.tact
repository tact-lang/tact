struct OptAddrStrInt {
    addr: Address?;
    name: String?;
    val: Int?;
}

contract OptAddrStrIntContract {
    f: OptAddrStrInt;

    init() {
        self.f = OptAddrStrInt{
            addr: null,
            name: null,
            val: null
        };
    }
}