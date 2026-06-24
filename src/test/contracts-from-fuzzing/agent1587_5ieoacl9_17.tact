struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Address }
struct S5 { e: Cell }

contract ManyStructs {
    field1: S1;
    field2: S2;
    field3: S3;
    field4: S4;
    field5: S5;

    init() {
        self.field1 = S1{a:1};
        self.field2 = S2{b:true};
        self.field3 = S3{c:"ok"};
        self.field4 = S4{d:myAddress()};
        self.field5 = S5{e:emptyCell()};
    }
}