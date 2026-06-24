struct ReorderTest {
    boolVal: Bool;
    intVal: Int;
    strVal: String;
}

contract FieldReordering {
    data: ReorderTest;

    init() {
        self.data = ReorderTest{
            boolVal: true,
            intVal: 100,
            strVal: "hi"
        };
    }
}