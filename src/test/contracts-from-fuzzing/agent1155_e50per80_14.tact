struct ComplexNested {
    val: Int;
    s: String;
    inner1: InnerStruct1;
    inner2: InnerStruct2;
}

struct InnerStruct1 {
    flag: Bool;
    text: String;
}

struct InnerStruct2 {
    cellData: Cell;
    optionalNum: Int?;
}

contract TestContract {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            val: 77,
            s: "Hi",
            inner1: InnerStruct1{
                flag: true,
                text: "Inner1"
            },
            inner2: InnerStruct2{
                cellData: emptyCell(),
                optionalNum: null
            }
        };
    }
}
