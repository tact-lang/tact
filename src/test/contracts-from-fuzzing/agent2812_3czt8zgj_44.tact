struct Struct1 {
    f1: Int as uint8;
    f2: Int as int16;
}

struct Struct2 {
    s1: Struct1;
    f3: Int;
}

contract SerializeMix {
    data: Struct2;

    init() {
        self.data = Struct2{
            s1: Struct1{ f1: 200, f2: -32000 },
            f3: 923847
        };
    }
}