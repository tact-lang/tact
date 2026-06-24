struct CompositeNested {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract CompositeNestedContract {
    nested: CompositeNested = CompositeNested{i:0,b:false,s:"",oi:null,ob:null,os:null};
}