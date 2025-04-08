struct NestedStringStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedStringFields {
    s1: NestedStringStruct;
    str1: String;
    s2: NestedStringStruct;

    init() {
        self.s1 = NestedStringStruct{ x:1, y:true, z:"one" };
        self.str1 = "hello";
        self.s2 = NestedStringStruct{ x:2, y:false, z:"two" };
    }

    receive() {
        let _ = self.s1;
        let _ = self.str1;
        let _ = self.s2;
    }
}
