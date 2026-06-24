struct OptionalContainer {
    s1: Int?;
    s2: Bool?;
    s3: String?;
    s4: Address?;
    s5: Cell?;
    s6: Slice?;
}

contract Test {
    field: OptionalContainer;
    init() {
        self.field = OptionalContainer{
            s1:null,s2:null,s3:null,s4:null,s5:null,s6:null
        };
    }
}