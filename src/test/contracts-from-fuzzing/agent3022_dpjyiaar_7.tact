struct S1 { f1: Int; f2: Int; }
struct S2 { s1first: S1; f3: Int; s1second: S1; }
contract RepeatStruct {
    data: S2;

    init() {
        self.data = S2{
            s1first: S1{f1:1,f2:2},
            f3: 3,
            s1second: S1{f1:4,f2:5}
        };
    }
}
