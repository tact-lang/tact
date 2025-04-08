struct MultiStruct {
    s1: SubStruct;
    s2: SubStruct;
}

struct SubStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiStructHolder {
    data: MultiStruct;

    init() {
        self.data = MultiStruct{
            s1: SubStruct{ a: 1, b: true, c: "foo" },
            s2: SubStruct{ a: 2, b: false, c: "bar" },
        };
    }
}