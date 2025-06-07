struct DeepNested {
    inner: Struct2;
}

struct Struct2 {
    val: Int;
    child: Struct3;
}

struct Struct3 {
    flag: Bool;
}

contract TestContract {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{ inner: Struct2{ val: 5, child: Struct3{ flag: false } } };
    }
}