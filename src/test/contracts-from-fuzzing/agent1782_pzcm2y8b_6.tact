struct SOptional {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Bool?;
}

contract TestContract {
    s: SOptional;

    init() {
        self.s = SOptional{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}