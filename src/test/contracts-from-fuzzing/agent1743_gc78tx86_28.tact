struct FuzzyContractState {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract FuzzyContract {
    state: FuzzyContractState;

    init() {
        self.state = FuzzyContractState{
            a:1,
            b:null,
            c:true,
            d:null,
            e:"hello",
            f:null,
            g:myAddress(),
            h:null
        };
    }
}