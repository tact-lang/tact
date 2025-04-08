struct SerStruct {
    a: Int as uint8;
    b: Int as int16;
    opt: Int? as uint8;
}

contract SerializeStruct {
    s: SerStruct = SerStruct{a:0,b:0,opt:null};
}