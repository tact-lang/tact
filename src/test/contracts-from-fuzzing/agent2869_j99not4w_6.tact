struct MultiOptional {
    sopt: String?;
    bopt: Bool?;
    addrOpt: Address?;
}

contract Opts {
    data: MultiOptional;
    
    init() {
        self.data = MultiOptional{
            sopt: null,
            bopt: null,
            addrOpt: null,
        };
    }
}
