struct OptionalContract {
    ctr: Address?;
}

contract TestOptionalContract {
    addr: OptionalContract;

    init() {
        self.addr = OptionalContract{ ctr: null };
    }
}