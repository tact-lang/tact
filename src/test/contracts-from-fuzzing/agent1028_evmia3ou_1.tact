struct ComplexStruct {
    x: Int;
    y: Int?;
    s: String;
    c: Cell;
    b: Bool;
}

contract StorageTest {
    data: ComplexStruct;
    
    init() {
        self.data = ComplexStruct{
            x: 1,
            y: null,
            s: "test",
            c: emptyCell(),
            b: true,
        };
    }
}
