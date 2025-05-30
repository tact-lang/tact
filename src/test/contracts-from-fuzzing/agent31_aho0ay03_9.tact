struct Tupley {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract TestContract {
    bigtuple: Tupley;

    init() {
        self.bigtuple = Tupley{a:1,b:2,c:3,d:4,e:5};
    }
}
