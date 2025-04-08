struct AllTypes {
    i: Int;
    si8: Int as int8;
    ui8: Int as uint8;
    si16: Int as int16;
    ui16: Int as uint16;
    si32: Int as int32;
    ui32: Int as uint32;
    si64: Int as int64;
    ui64: Int as uint64;
    si128: Int as int128;
    ui128: Int as uint128;
    si256: Int as int256;
    ui256: Int as uint256;
    i257: Int as int257;
    b: Bool;
    s: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    c: Cell;
    addr: Address;
}

contract AllTypesTest {
    v: AllTypes;
    init() {
        self.v = AllTypes{
            i:1,si8:-2,ui8:3,si16:-4,ui16:5,si32:-6,ui32:7,si64:-8,ui64:9,
            si128:-10,ui128:11,si256:-12,ui256:13,i257:14,b:true,s:"x",
            optInt:null,optBool:false,optStr:null,c:emptyCell(),addr:myAddress()
        };
    }
}
