struct Data {
    i: Int as uint16;
    b: Bool;
    s: String;
    o: Int?;
}

contract SerializeTest {
    d: Data;

    init() {
        self.d = Data{
            i:1234,
            b:true,
            s:"abc",
            o:null
        };
    }
}
