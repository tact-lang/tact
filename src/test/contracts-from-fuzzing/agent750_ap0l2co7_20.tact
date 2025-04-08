struct Par {
    x: Int;
}
struct Qux {
    p: Par?;
}
contract OptStructInsideStruct {
    q: Qux;
    init() {
        self.q = Qux{p:null};
    }
}