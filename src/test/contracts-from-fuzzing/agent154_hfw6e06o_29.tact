struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OnlyOptionalsContract {
    data: OnlyOptionals;

    init() {
        self.data = OnlyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}