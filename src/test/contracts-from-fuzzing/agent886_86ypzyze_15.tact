struct SerStruct {
    a: Int as uint1;
    b: Int as int2;
    c: Int as uint3;
    d: Int as int4;
}

contract TestContract {
    val: SerStruct;
    init() {
        self.val = SerStruct{a:1,b:-1,c:7,d:-8};
    }
}