contract ManyStructs {
    a: StructA;
    b: StructB;
    c: StructC;
    d: StructD;
    e: StructE;

    init() {
        self.a = StructA{ field:1 };
        self.b = StructB{ field:true };
        self.c = StructC{ field:"hi" };
        self.d = StructD{ field:myAddress() };
        self.e = StructE{ field:emptyCell() };
    }
}

struct StructA { field: Int }
struct StructB { field: Bool }
struct StructC { field: String }
struct StructD { field: Address }
struct StructE { field: Cell }
