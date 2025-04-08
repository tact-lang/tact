struct MultiLayer {
    f1: Int;
    f2: String;
    f3: Int?;
    f4: String?;
    f5: Bool;
    f6: Bool?;
}

struct Envelope {
    inner: MultiLayer;
}

contract LayersTest {
    payload: Envelope;

    init() {
        self.payload = Envelope{ inner: MultiLayer{
            f1:1,
            f2:"a",
            f3:null,
            f4:null,
            f5:true,
            f6:null
        }};
    }
}