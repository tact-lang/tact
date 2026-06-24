struct LongNames {
    thisIsAnInt: Int;
    anotherLongBoolFlagField: Bool;
    yetAnotherLongNameForAStringField: String;
    deepNested: DeepInner;
}

struct DeepInner {
    deepValue: Int;
    descriptiveFlag: Bool;
}

contract VerboseNames {
    inform: LongNames;

    init() {
        self.inform = LongNames{
            thisIsAnInt: 1,
            anotherLongBoolFlagField: false,
            yetAnotherLongNameForAStringField: "abc",
            deepNested: DeepInner{
                deepValue: 100,
                descriptiveFlag: true
            }
        };
    }
}