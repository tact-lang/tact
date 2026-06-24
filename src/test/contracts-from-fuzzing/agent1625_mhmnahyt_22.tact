struct EmptyOptStruct {
    x: Int?;
}

contract OptWithNullInit {
    s: EmptyOptStruct;

    init() {
        self.s = EmptyOptStruct{
            x: null,
        };
    }
}
