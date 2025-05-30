struct OptionalAddrStruct {
    val: Address?;
}

contract TestContract {
    s: OptionalAddrStruct;

    init() {
        self.s = OptionalAddrStruct{
            val: null
        };
    }
}