struct SubStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
}

struct TopStruct {
    p1: Int;
    p2: SubStruct;
    p3: Bool;
    p4: SubStruct;
}

contract MultipleNestedFields {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            p1: 10,
            p2: SubStruct{a: 1, b: true, c: "foo", d: null, e: null},
            p3: false,
            p4: SubStruct{a: 2, b: false, c: "bar", d: 5, e: "opt"},
        };
    }
}
