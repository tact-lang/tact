struct Rec1 { val: Int }
struct Rec2 { rec: Rec1 }
struct Rec3 { rec2: Rec2 }

contract DeepRecur {
    val: Rec3;
    
    init() {
        self.val = Rec3 {
            rec2: Rec2 {
                rec: Rec1 {
                    val: 777
                }
            }
        };
    }
}