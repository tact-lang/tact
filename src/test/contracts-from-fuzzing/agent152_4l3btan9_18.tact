struct BigNested {
    intA: Int; intB: Int; intC: Int; intD: Int; intE: Int;
    boolA: Bool; boolB: Bool; boolC: Bool;
    strA: String; strB: String; strC: String;
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    val1: Int; val2: Int;
    flag1: Bool; flag2: Bool;
    desc: String;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            intA: 1, intB: 2, intC:3, intD:4, intE:5,
            boolA:true, boolB:false, boolC:true,
            strA:"x", strB:"y", strC:"z",
            nestedOpt: InnerStruct{
                val1:10, val2:20,
                flag1:false, flag2:true,
                desc:"inner"
            }
        };
    }
}
