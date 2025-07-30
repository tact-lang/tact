struct OptionalAtTopLevel {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalTopLevelTest {
    o: OptionalAtTopLevel;

    init() {
        self.o = OptionalAtTopLevel{
            optInt:null,optBool:null,optStr:null
        };
    }
}
