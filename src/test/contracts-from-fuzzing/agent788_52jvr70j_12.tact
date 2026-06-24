struct InnerOptionals {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalsInStruct {
    val: InnerOptionals;

    init() {
        self.val = InnerOptionals{
            s: null,
            b: null,
            i: null
        };
    }
}