struct LongNames {
    veryLongFieldNameNumberOne: Int;
    extremelyVerboseFieldTwoIsThis: Bool;
    theThirdFieldHasAlsoALongNameIndeed: String;
    lastOneButItIsStillQuiteBigNameGoesHere: Address?;
}

contract LongNamesStore {
    data: LongNames = LongNames{
        veryLongFieldNameNumberOne: 4,
        extremelyVerboseFieldTwoIsThis: false,
        theThirdFieldHasAlsoALongNameIndeed: "abc",
        lastOneButItIsStillQuiteBigNameGoesHere: null,
    };

    init() {
        self.data = self.data;
    }
}