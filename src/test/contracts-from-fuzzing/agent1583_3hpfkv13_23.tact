struct PrimitivesWithSerializers {
    a: Int as uint1;
    b: Int as int1;
    c: Int as uint4;
    d: Int as int16;
    e: Int as coins;
}

contract SerializePrimitive {
    storage: PrimitivesWithSerializers;

    init() {
        self.storage = PrimitivesWithSerializers{a:1,b:-1,c:8,d:1000,e:1500};
    }
}