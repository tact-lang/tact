struct S1 { x: Int }
struct S2 { x: Bool }
struct S3 { x: String }
struct S4 { x: Cell }
struct S5 { x: Address }

contract LongStructs {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;

    init() {
        self.f1 = S1{x:1};
        self.f2 = S2{x:true};
        self.f3 = S3{x:"a"};
        self.f4 = S4{x:emptyCell()};
        self.f5 = S5{x:myAddress()};
    }
}