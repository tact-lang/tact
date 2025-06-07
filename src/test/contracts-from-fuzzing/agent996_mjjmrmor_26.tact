struct TailOptional {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestStorage {
    data: TailOptional;

    init() {
        self.data = TailOptional{
            a: 1,
            b: false,
            c: null,
        };
    }
}