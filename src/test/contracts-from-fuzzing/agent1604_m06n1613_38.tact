struct Struct1 {
    p: Int?;
}

struct Struct2 {
    inner: Struct1;
}

contract DeepNull {
    s: Struct2;

    init() {
        self.s = Struct2 { inner: Struct1{ p:null } };
    }

    receive() {}
}