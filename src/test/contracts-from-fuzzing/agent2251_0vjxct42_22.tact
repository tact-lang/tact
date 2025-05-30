struct TailOptional {
    a: Int;
    b: Bool;
    c: String?;
}

contract TailOptionalStruct {
    tail: TailOptional;

    init() {
        self.tail = TailOptional{
            a: 5,
            b: false,
            c: null,
        };
    }
}