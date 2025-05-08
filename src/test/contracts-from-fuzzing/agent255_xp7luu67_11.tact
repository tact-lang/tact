struct WithLongFieldNames {
    thisIsAReallyLongFieldNameForTest: Int;
    anotherExtremelyLongFieldNameHere: String;
}

contract TestContract {
    data: WithLongFieldNames;

    init() {
        self.data = WithLongFieldNames{
            thisIsAReallyLongFieldNameForTest: 17,
            anotherExtremelyLongFieldNameHere: "hi",
        };
    }
}