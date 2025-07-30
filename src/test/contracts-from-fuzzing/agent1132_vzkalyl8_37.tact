struct Combo {
    id: Int;
    flag: Bool;
    txt: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
}

contract AllTypes {
    st: Combo = Combo{id:1, flag:true, txt:"z", optI:null, optB:true, optS:null};
}