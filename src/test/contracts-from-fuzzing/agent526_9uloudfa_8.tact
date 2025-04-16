struct SubNested {
    subval: Int;
    subdesc: String;
}

struct Nested {
    nestedval: Int;
    nestedopt: SubNested?;
}

struct MainStruct {
    id: Int;
    nest: Nested;
}

contract TripleNested {
    data: MainStruct;

    init() {
        self.data = MainStruct{
            id: 42,
            nest: Nested{
                nestedval: 21,
                nestedopt: SubNested{
                    subval: 11,
                    subdesc: "zzz",
                },
            },
        };
    }

    receive() {}
}