struct SerialNested {
    a: Int as int8;
    b: Bool;
}

struct ContainsNested {
    nest: SerialNested;
    c: Int as uint16;
}

contract TestSerialNested {
    data: ContainsNested;
    init() {
        self.data = ContainsNested {
            nest: SerialNested{ a:4, b:true },
            c:15
        };
    }
}