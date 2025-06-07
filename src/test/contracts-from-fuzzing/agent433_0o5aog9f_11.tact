struct InnerMany {
    int1: Int;
    bool1: Bool;
    str1: String;
}

contract TestContract {
    a: InnerMany;
    b: InnerMany;
    c: InnerMany;
    d: InnerMany;
    e: InnerMany;

    init() {
        self.a = InnerMany{ int1: 1, bool1: true, str1: "a" };
        self.b = InnerMany{ int1: 2, bool1: false, str1: "b" };
        self.c = InnerMany{ int1: 3, bool1: true, str1: "c" };
        self.d = InnerMany{ int1: 4, bool1: false, str1: "d" };
        self.e = InnerMany{ int1: 5, bool1: true, str1: "e" };
    }
}