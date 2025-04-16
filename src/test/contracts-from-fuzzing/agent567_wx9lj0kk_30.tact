// contract with several nested structs, all optional, and mix of fields
struct Inner1 { x: Int = 5; flag: Bool = true; }
struct Inner2 { s: String?; num: Int?; }
struct Inner3 { inside: Inner2?; }

contract Mega {
    i1: Inner1?;
    i2: Inner2?;
    i3: Inner3?;
    init() {
        self.i1 = Inner1{x:99,flag:false};
        self.i2 = Inner2{s:null,num:null};
        self.i3 = null;
    }
}
