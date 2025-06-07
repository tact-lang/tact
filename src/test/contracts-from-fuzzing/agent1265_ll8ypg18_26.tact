// Minimal struct but with very long field names
struct LongNames {
    thisIsAReallyLongFieldNameJustToTestTheCompilerHandlingOfIt: Int;
}

contract LongNameContract {
    data: LongNames;

    init() {
        self.data = LongNames{
            thisIsAReallyLongFieldNameJustToTestTheCompilerHandlingOfIt: 42
        };
    }
}