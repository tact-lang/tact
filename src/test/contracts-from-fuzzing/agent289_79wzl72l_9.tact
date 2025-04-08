struct LongNames {
    someReallyLongFieldNameThatShouldNotBreakAnything: Int;
    anotherQuiteLongFieldNameJustToSeeWhatHappens: Bool;
    thisIsYetAnotherLongNamedFieldWithAString: String;
}

contract LongStructNamesTest {
    info: LongNames;

    init() {
        self.info = LongNames{
            someReallyLongFieldNameThatShouldNotBreakAnything: 42,
            anotherQuiteLongFieldNameJustToSeeWhatHappens: true,
            thisIsYetAnotherLongNamedFieldWithAString: "test"
        };
    }
}