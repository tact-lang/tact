struct S1 {
    f1: Int;
}
struct S2 {
    f2: Bool;
}
struct S3 {
    f3: String;
}
struct S4 {
    f4: Cell;
}
struct S5 {
    f5: Address;
}
struct All {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
}
contract TestContract {
    data: All;
    init() {
        self.data = All{
            s1: S1{f1:1},
            s2: S2{f2:true},
            s3: S3{f3:"s"},
            s4: S4{f4:emptyCell()},
            s5: S5{f5:myAddress()}
        };
    }
}