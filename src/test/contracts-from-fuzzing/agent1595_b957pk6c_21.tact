struct A { f: Int; }
struct B { f: Int; }
struct C { a: A; b: B; opt: Int?; bval: Bool; text: String; }

contract TestContract {
    d: C;

    init() {
        self.d = C{a: A{f:1}, b: B{f:2}, opt:null, bval:true, text:"ok"};
    }
}