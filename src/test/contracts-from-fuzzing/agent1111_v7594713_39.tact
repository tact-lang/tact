// test persistent fields default init of nested struct that contains optional
struct C {
    x:Int;
    y:Int?=null;
}
contract DefaultNestedStruct {
    c:C= C{x:5,y:null};
    init() {}
}