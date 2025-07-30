struct NestedStruct1 {
    a: Int;
    b: Bool;
    c: String;
}

contract UseNested {
    val: NestedStruct1;
    
    init() {
        self.val = NestedStruct1{ a: 1, b: true, c: "hello" };
    }
}