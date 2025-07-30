struct ManyNestedOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Slice?;
    f4: Address?;
    f5: Cell?;
    f6: String?;
}

contract ManyNestedOptionalFields {
    nested: ManyNestedOptionals;

    init() {
        self.nested = ManyNestedOptionals{
            f1:null, f2:null, f3:null, f4:null, f5:null, f6:null
        };
    }
}