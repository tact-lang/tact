struct Rec1 { optInt: Int?; optBool: Bool?; }
struct Rec2 { r1: Rec1?; str: String; }

contract TestContract {
    rec2opt: Rec2?;

    init() {
        self.rec2opt = Rec2{ r1: null, str: "hello" };
    }
}