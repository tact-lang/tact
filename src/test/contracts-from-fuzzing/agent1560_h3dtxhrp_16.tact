struct SerStruct {
    a: Int as int128;
    b: Int as uint16;
    c: Int as coins;
    d: Int; // default serialization
}

contract TestContract {
    val: SerStruct = SerStruct{a:1,b:2,c:3,d:4};
}