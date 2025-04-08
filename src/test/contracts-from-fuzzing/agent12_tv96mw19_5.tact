struct DeepNest {
    s1: Struct1;
}

struct Struct1 {
    s2: Struct2;
}

struct Struct2 {
    s3: Struct3;
}

struct Struct3 {
    f: Int?;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{ s1: Struct1{ s2: Struct2{ s3: Struct3{ f: null } } } };
    }
}