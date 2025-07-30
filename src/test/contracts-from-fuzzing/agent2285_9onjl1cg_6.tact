struct Rec1 { val: Int; opt: Rec2?; }
struct Rec2 { val: Bool; opt: Rec3?; }
struct Rec3 { val: String; }

contract Test6 {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            val: 5,
            opt: Rec2{
                val: false,
                opt: null,
            },
        };
    }
}