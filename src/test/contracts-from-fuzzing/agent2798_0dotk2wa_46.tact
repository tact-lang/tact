struct FinalTest {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract FinalEdgeCasesContract {
    data: FinalTest;

    init() {
        self.data = FinalTest{
            intVal: -1,
            boolVal: false,
            strVal: "end",
            optInt: null,
            optBool: null,
            optStr: "!"
        };
    }
}