struct Addressed {
    addr: Address;
    val: Int as uint64;
    flag: Bool;
}

contract TestContract {
    data: Addressed;

    init() {
        self.data = Addressed{
            addr: myAddress(),
            val: 123456789,
            flag: true
        };
    }
}