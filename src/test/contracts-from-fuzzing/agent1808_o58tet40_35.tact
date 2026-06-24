// Testing long struct field names
struct BigNames {
    someReallyLongButValidNameForAFieldOne: Int;
    anotherUltraLengthyYetPerfectlyValidNameForAField: Bool;
    andYetAnotherSuperVerboseFieldNameStringHolder: String;
}

contract BigNamesTest {
    bigNames: BigNames;

    init() {
        self.bigNames = BigNames{
            someReallyLongButValidNameForAFieldOne: 42,
            anotherUltraLengthyYetPerfectlyValidNameForAField: true,
            andYetAnotherSuperVerboseFieldNameStringHolder: "abc"
        };
    }
}