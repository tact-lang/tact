struct MultipleOptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Slice?;
}

contract TestContract {
    data: MultipleOptionalFields;
    init() {
        self.data = MultipleOptionalFields{
            a:null,b:null,c:null,d:null,e:null
        };
    }
}
