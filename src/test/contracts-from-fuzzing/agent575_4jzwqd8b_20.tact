struct DeeplyNested {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;
}

struct Struct1 { val: Int; }
struct Struct2 { nested: Struct1; flag: Bool; }
struct Struct3 { name: String; opt: Bool?; }

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            s1: Struct1{ val: 1 },
            s2: Struct2{ nested: Struct1{ val:2 }, flag:true },
            s3: Struct3{ name:"d", opt:null }
        };
    }
}
