struct TupleStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiField {
    val1: TupleStruct;
    val2: TupleStruct;
    val3: TupleStruct;

    init() {
        self.val1 = TupleStruct{ x:1, y:true, z:"a" };
        self.val2 = TupleStruct{ x:2, y:false, z:"b" };
        self.val3 = TupleStruct{ x:3, y:true, z:"c" };
    }
}