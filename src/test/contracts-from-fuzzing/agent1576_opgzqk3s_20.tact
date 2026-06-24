struct OptionalList {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Address?;
}

contract OptionalsStress {
    opt: OptionalList;

    init() {
        self.opt = OptionalList{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}