struct Holder {
    num: Int;
    text: String;
    flag: Bool;
    optInt: Int?;
    optBool: Bool?;
}

contract ManyTypesPersistent {
    field: Holder = Holder{num:0, text:"", flag:false, optInt:null, optBool:null};
}