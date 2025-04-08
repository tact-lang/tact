struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionsOnStruct {
    val: ManyOpts = ManyOpts{
        a:null,b:true,c:null,d:4,e:null,f:"hi"
    };
}