struct SubStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    st1: SubStruct;
    st2: SubStruct;
    flag: Bool;

    init() {
        self.st1 = SubStruct{ x:1, y:true, z:"A" };
        self.st2 = SubStruct{ x:2, y:false, z:"B" };
        self.flag = true;
    }
}