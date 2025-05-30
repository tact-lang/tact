struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract AllNullInitial {
    m: ManyOptional;

    init() {
        self.m = ManyOptional{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}