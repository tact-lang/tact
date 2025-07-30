struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract ContractWithManyPersistent {
    num: Int = 0;
    flag: Bool = false;
    text: String = "";
    optionNum: Int? = null;
    nested: LargeNested = LargeNested{a:0,b:false,c:"",d:null,e:null,f:null};
}