struct EmptyOptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptNullInit {
    field: EmptyOptStruct;

    init() {
        self.field = EmptyOptStruct{
            a: null,
            b: null,
            c: null
        };
    }
}
