struct OptStruct {
    si: Int?;
    sb: Bool?;
}

contract StructOptionals {
    one: OptStruct;
    two: OptStruct;

    init() {
        self.one = OptStruct{si:null,sb:null};
        self.two = OptStruct{si:42,sb:true};
    }
}