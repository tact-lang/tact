struct ManyOptionalsStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Address?;
    f6: String?;
    f7: Int?;
    f8: Bool?;
    f9: Cell?;
    f10: Address?;
}

contract ManyOptionalsContract {
    payload: ManyOptionalsStruct = ManyOptionalsStruct{
        f1: null, f2: null, f3: null, f4: null, f5: null,
        f6: null, f7: null, f8: null, f9: null, f10: null
    };
}