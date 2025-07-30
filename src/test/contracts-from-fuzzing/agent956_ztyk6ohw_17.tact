struct SInner1 {
    a: Int?;
}
struct SInner2 {
    b: Bool?;
}
struct SMid {
    s1: SInner1;
    s2: SInner2;
}

contract NestedOptionalStructs {
    data: SMid;
    init() {
        self.data = SMid{
            s1: SInner1{ a:null }, s2: SInner2{ b:null }
        };
    }
}
