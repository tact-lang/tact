struct OptNested { inner: Int?; str: String; }

contract OptionalInStruct {
    optNested: OptNested;
    init() {
        self.optNested = OptNested{ inner:null, str:"abc" };
    }
}