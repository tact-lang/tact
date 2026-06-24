struct Struct1 {
    x: Int;
}

struct Struct2 {
    y: Bool;
}

struct Struct3 {
    z: Address;
}

struct Outer {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            s1: Struct1{x: 99},
            s2: Struct2{y: false},
            s3: Struct3{z: myAddress()},
            o1: null,
            o2: null,
            o3: null,
        };
    }
}