struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
    innerStr: String;
    innerAddr: Address?;
    innerCell: Cell?;
    innerSlice: Slice?;
}

contract FixedStorageStructTest {
    complex: NestedStruct = NestedStruct{
        innerInt: 10,
        innerBool: true,
        innerStr: "nested",
        innerAddr: null,              
        innerCell: null,
        innerSlice: null
    };

    init() {
        self.complex = NestedStruct{
            innerInt: 20,
            innerBool: false,
            innerStr: "changed",
            innerAddr: myAddress(),    
            innerCell: emptyCell(),
            innerSlice: emptyCell().asSlice()
        };
    }

    receive() {
        let _ = self.complex.innerInt + 1;
    }
}