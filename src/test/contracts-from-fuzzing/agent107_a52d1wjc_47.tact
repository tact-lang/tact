struct DataStruct {
    s: String;
    opt: Int?;
}

contract LargeFlat {
    a: DataStruct;
    b: DataStruct;
    c: DataStruct;
    d: DataStruct;
    e: DataStruct;
    f: DataStruct;
    g: DataStruct;
    h: DataStruct;
    i: DataStruct;
    j: DataStruct;

    init() {
        self.a = DataStruct{ s:"a", opt:null };
        self.b = DataStruct{ s:"b", opt:null };
        self.c = DataStruct{ s:"c", opt:null };
        self.d = DataStruct{ s:"d", opt:null };
        self.e = DataStruct{ s:"e", opt:null };
        self.f = DataStruct{ s:"f", opt:null };
        self.g = DataStruct{ s:"g", opt:null };
        self.h = DataStruct{ s:"h", opt:null };
        self.i = DataStruct{ s:"i", opt:null };
        self.j = DataStruct{ s:"j", opt:null };
    }
}