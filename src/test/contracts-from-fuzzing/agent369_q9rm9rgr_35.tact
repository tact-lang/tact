struct ClusteredStruct {
    first: Int;
    opt1: Int?;
    plain: Bool;
    opt2: String?;
    last: Address;
}

contract TestContract {
    data: ClusteredStruct;

    init() {
        self.data=ClusteredStruct{
            first:1,
            opt1:null,
            plain:false,
            opt2:"hi",
            last:myAddress()
        };
    }
}