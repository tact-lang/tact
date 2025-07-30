// Wide struct close to realistic field limit
struct ManyFieldsStruct {
    a1: Int;
    a2: Int;
    a3: Bool;
    a4: Cell;
    a5: Address;
    a6: Slice;
    a7: Int?;
    a8: String?;
    a9: Bool?;
    a10: Cell?;
    a11: Address?;
    a12: Slice?;
    a13: String;
    a14: Int;
    a15: Bool;
    a16: String;
}

contract WideFields {
    data: ManyFieldsStruct;

    init() {
        self.data = ManyFieldsStruct{
            a1: 1,a2: 2,a3: true,a4: emptyCell(),a5: myAddress(),a6: emptyCell().asSlice(),
            a7: null,a8: null,a9: null,a10: null,a11: null,a12: null,a13: "hi",a14: 42,a15: false,a16: "end"
        };
    }
}