struct Rec1 { rec2: Rec2; val1: Int; }
struct Rec2 { rec3: Rec3; val2: Int; }
struct Rec3 { val3: Int; }

contract Recursive {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            rec2: Rec2{
                rec3: Rec3{ val3: 100 },
                val2: 50
            },
            val1: 25
        };
    }
}