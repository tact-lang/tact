struct Multiple {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
}

contract Multifields {
    m: Multiple;
    init() {
        self.m = Multiple{ a:1, b:null, c:true, d:null };
    }
}