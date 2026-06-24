struct SerialOptionalStruct {
    x: Int? as uint8;
    y: Int? as int16;
    z: Int? as uint64;
}

contract SerialOptContract {
    v: SerialOptionalStruct;

    init() {
        self.v = SerialOptionalStruct{x:null, y:null, z:null};
    }
}