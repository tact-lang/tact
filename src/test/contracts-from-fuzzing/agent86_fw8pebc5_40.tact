// nested message with optional struct fields
struct InStruct {
    s: String;
}

message(33) ComplexMsg {
    a: Int;
    b: Bool?;
    c: String?;
    d: InStruct?;
}

contract C {
    v: ComplexMsg;
    init() {
        self.v = ComplexMsg{ a:1, b:null, c:null, d:null };
    }
}