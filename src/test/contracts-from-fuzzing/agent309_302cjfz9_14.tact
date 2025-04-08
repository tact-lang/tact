struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
}

contract ManyLargeStructs {
    st1: LargeStruct;
    st2: LargeStruct;
    st3: LargeStruct;

    init() {
        self.st1 = LargeStruct{ a:1,b:true,c:"c",d:myAddress(),e:1,f:true,g:"c",h:myAddress(),i:5,j:false };
        self.st2 = self.st1;
        self.st3 = self.st2;
    }
}