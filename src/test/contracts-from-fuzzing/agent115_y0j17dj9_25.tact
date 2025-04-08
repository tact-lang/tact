struct Nesting1 {
    v: Int;
}
struct Nesting2 {
    s: String;
    n: Nesting1;
}
struct Nesting3 {
    flag: Bool;
    inn: Nesting2;
}
contract DeepComb {
    complex: Nesting3;
    init() {
        self.complex = Nesting3{
            flag: true,
            inn: Nesting2{
                s: "ok",
                n: Nesting1{ v: 77 }
            }
        };
    }
}