struct Snug {
    a: Int as uint4;
    b: Int? as uint5;
    c: Bool?; 
}

contract SerialOpt {
    s: Snug?;

    init() {
        self.s = Snug{ a:1, b:null, c:true };
    }
}
