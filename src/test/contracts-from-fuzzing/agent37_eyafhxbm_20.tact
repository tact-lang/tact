struct TestStruct {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Int?;
    val5: Bool?;
    val6: String?;
}

contract TestContract {
    s1: TestStruct = TestStruct{val1:1,val2:true,val3:"a",val4:null,val5:null,val6:null};
    s2: TestStruct = TestStruct{val1:2,val2:false,val3:"b",val4:4,val5:null,val6:"c"};

    init(){
        self.s1 = TestStruct{val1:11,val2:false,val3:"x",val4:14,val5:true,val6:"y"};
        self.s2 = TestStruct{val1:22,val2:true,val3:"z",val4:null,val5:false,val6:null};
    }
    receive(){}
}