struct NestedDeeply2 {
    lv1: S1;
}
struct S1 {
    lv2: S2;
}
struct S2 {
    lv3: S3;
}
struct S3 {
    lv4: S4;
}
struct S4 {
    lv5: Int;
}

contract TestContract {
    f: NestedDeeply2;

    init() {
        self.f = NestedDeeply2{
            lv1: S1{
                lv2: S2{
                    lv3: S3{
                        lv4: S4{
                            lv5: 1234
                        }
                    }
                }
            }
        };
    }
}