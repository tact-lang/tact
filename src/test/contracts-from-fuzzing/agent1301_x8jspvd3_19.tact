struct OptionalSerialize {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as coins;
}

contract TestContract {
    o: OptionalSerialize;
    init() {
        self.o = OptionalSerialize{ a:null, b:null, c:null };
    }
}