struct AddrOpt {
    owner: Address?;
    admin: Address?;
}

contract AddrStructOpt {
    s: AddrOpt;

    init() {
        self.s = AddrOpt{
            owner: null,
            admin: null,
        };
    }
}