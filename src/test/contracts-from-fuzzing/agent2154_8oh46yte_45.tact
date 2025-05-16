struct OptionalDefaults {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract AllNullOpt {
    o: OptionalDefaults;

    init() {
        self.o = OptionalDefaults{i:null,b:null,s:null};
    }
}