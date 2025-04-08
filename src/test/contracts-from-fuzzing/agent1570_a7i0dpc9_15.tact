struct MixOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract TestContract {
    m: MixOptionals;
    init() {
        self.m = MixOptionals{
            a:null, b:true, c:null, d:null, e:null
        };
    }
}