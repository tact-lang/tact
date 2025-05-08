struct TripleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TripleOptTest {
    store: TripleOptionals;
    init() {
        self.store = TripleOptionals{ a:null,b:true,c:null };
    }
    receive() {}
}