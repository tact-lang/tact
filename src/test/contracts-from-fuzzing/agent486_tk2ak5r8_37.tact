struct ManyAddrOpt {
    a1: Address?;
    a2: Address?;
    a3: Address?;
    a4: Address?;
    a5: Address?;
    a6: Address?;
    a7: Address?;
    a8: Address?;
}

contract TestManyAddrOpt {
    data: ManyAddrOpt;

    init() {
        self.data = ManyAddrOpt{
            a1:null,a2:null,a3:null,a4:null,a5:null,a6:null,a7:null,a8:null
        };
    }
}