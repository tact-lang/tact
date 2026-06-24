struct BigOpt {
    x: Int? as int64;
    y: Int? as uint128;
    z: Int? as int32;
    w: Int? as uint8;
}

contract OptionalSerializedFields {
    data: BigOpt;

    init() {
        self.data = BigOpt{
            x:null,y:null,z:null,w:null
        };
    }
}