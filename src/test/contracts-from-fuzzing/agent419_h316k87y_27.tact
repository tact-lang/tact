// Test struct with many bools and optionals fills bits
struct Bools {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    f: Bool?;
}

contract T {
    f: Bools;

    init() {
        self.f = Bools{ a:true, b:null, c:false, d:null, e:true, f:null };
    }
}