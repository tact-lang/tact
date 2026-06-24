struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedTest {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{a: 1, b: true, c: "hello"};
    }
}