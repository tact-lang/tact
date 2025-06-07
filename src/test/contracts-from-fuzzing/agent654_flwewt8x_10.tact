struct Rec1 {
    f1: Int;
    f2: String;
}
struct Rec2 {
    g1: Bool;
    g2: String;
    g3: Rec1;
}
struct Rec3 {
    h1: Bool;
    h2: Int;
    h3: Rec2;
}
contract TestContract {
    nestedRec: Rec3;
    init() {
        self.nestedRec = Rec3{
            h1: true,
            h2: 123,
            h3: Rec2{
                g1: false,
                g2: "hi",
                g3: Rec1{ f1: 999, f2: "bye" }
            }
        };
    }
}