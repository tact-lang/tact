struct WideAddressOpt {
    a1: Address?; a2: Address?; a3: Address?; a4: Address?; a5: Address?;
    a6: Address?; a7: Address?; a8: Address?; a9: Address?; a10: Address?;
}

contract WideAddrOptContract {
    addresses: WideAddressOpt;

    init() {
        self.addresses = WideAddressOpt{
            a1:null, a2:myAddress(), a3:null, a4:myAddress(), a5:null,
            a6:myAddress(), a7:null, a8:myAddress(), a9:null, a10:myAddress()
        };
    }
}