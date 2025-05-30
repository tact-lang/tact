struct Rec1 {
    val: Int;
    nest: Rec2;
}

struct Rec2 {
    flag: Bool;
    rec3: Rec3;
}

struct Rec3 {
    msg: String;
    optInt: Int?;
}

contract Test {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            val: 99,
            nest: Rec2{
                flag: true,
                rec3: Rec3{ msg:"hi", optInt:null },
            },
        };
    }
}