struct AddrOpt {
    main: Address;
    optional: Address?;
}

contract AddrOptTest {
    a: AddrOpt;
    
    init() {
        self.a = AddrOpt{
            main: myAddress(),
            optional: null
        };
    }
}