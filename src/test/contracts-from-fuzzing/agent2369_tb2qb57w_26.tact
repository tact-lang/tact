// contract with flat optional init assignments
contract FlatOptionAssign {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a=null;
        self.b=null;
        self.c=null;
    }
}