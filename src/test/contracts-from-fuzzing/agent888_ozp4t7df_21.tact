struct InherentlyNullable {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract NullInit {
    store: InherentlyNullable;

    init() {
        self.store = InherentlyNullable{
            a:null,b:null,c:null,
        };
    }
}