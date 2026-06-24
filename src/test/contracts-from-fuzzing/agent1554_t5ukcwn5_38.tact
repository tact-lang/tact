struct A { b: Int?; s: String; }
contract Complex1 {
    f: A;

    init() {
        self.f = A{
            b:null,
            s:"hi"
        };
    }
}