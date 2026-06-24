// multiple structs with interleaved optionals and defaults
struct Combo1 { a: Int; b: String?; }
struct Combo2 { x: Bool = true; y: Int?; }
struct Combo3 { first: Combo1; second: Combo2; third: String = "3"; }

contract MultiCombo {
    stuff: Combo3;

    init() {
        self.stuff = Combo3{ first: Combo1{ a:1, b:null }, second: Combo2{}, third: "done" };
    }
}