struct DeeplyNested {
    sub1: SubStruct1;
    sub2: SubStruct2;
}

struct SubStruct1 {
    in1: Int;
    flag: Bool;
    optStr: String?;
}

struct SubStruct2 {
    address: Address;
    optCell: Cell?;
    inner: SubSubStruct;
}

struct SubSubStruct {
    num: Int;
    txt: String;
}

contract NestedLevels {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            sub1: SubStruct1{in1: 1, flag: false, optStr: null},
            sub2: SubStruct2{
                address: myAddress(),
                optCell: null,
                inner: SubSubStruct{num: 77, txt: "abc"}
            }
        };
    }
}