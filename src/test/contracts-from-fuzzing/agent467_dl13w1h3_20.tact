// Struct with long sequence Int -> Bool -> String repeat
struct Seq {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int;
    b2: Bool;
    s2: String;
}

contract SeqHolder {
    x: Seq;

    init() {
        self.x = Seq{
            i1:1, b1:true, s1:"a",
            i2:2, b2:false, s2:"b"
        };
    }
}
