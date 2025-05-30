struct Simple {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: String;
    field5: Cell;
}

contract TestContract {
    val: Simple;

    init() {
        self.val = Simple{
            field1: 1,
            field2: true,
            field3: myAddress(),
            field4: "hello",
            field5: emptyCell(),
        };
    }
}