struct OuterX {
    num: Int;
    innerStruct: InnerX;
}

struct InnerX {
    flag: Bool;
    text: String;
}

contract StructInField {
    value: OuterX;

    init() {
        self.value = OuterX{
            num: 55,
            innerStruct: InnerX{flag:true, text:"nested"},
        };
    }
}
