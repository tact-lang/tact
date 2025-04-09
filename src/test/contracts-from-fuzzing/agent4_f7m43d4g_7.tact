struct BigOne {
    intVal: Int;
    u4: Int as uint4;
    coinVal: Int as coins;
    flag: Bool;
    txt: String;
    addrOpt: Address?;
}

contract WithAddrNull {
    big: BigOne = BigOne{
        intVal: 1,
        u4: 2,
        coinVal: 3,
        flag: true,
        txt: "abc",
        addrOpt: null
    };
}