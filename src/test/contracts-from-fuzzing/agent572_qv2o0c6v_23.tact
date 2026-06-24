struct OuterStruct {
    a: Int;
    b: Bool;
    c: Address;
}

contract ContractWithStructAndField {
    x: Int;
    y: OuterStruct;
    init() {
        self.x = 111;
        self.y = OuterStruct { a:1, b:true, c:myAddress() };
    }
}