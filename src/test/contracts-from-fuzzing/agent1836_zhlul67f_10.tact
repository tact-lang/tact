struct OptionalStruct {
    f: Bool;
    s: String?;
    n: Int?;
    a: Address?;
}

contract ContractWOptStruct {
    st: OptionalStruct;

    init() {
        self.st = OptionalStruct{
            f:true,
            s:null,
            n:null,
            a:null,
        };
    }
}