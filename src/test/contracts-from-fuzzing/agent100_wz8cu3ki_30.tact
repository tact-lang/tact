struct OptionalAdd {
    s: String?;
    b: Bool?;
    i: Int?;
    a: Address?;
}

contract Test31 {
    o: OptionalAdd;

    init() {
        self.o = OptionalAdd{ s:null, b:null, i:null, a:null };
    }
}