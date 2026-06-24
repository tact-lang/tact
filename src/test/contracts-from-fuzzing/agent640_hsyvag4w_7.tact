struct S1 {
    num: Int;
    flag: Bool?;
    txt: String;
}

contract TestFuzz {
    data1: S1 = S1{num:0, flag:null, txt:""};
    data2: S1 = S1{num:1, flag:true, txt:"hello"};
    data3: S1 = S1{num:-1, flag:false, txt:"wor"};

    init() {}
}