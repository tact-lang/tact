struct Ok1 { a: Int; }
struct Ok2 { x: Ok1; }

contract C1 { fld: Ok2; init() { self.fld = Ok2{ x: Ok1{a:7} }; } }

contract C2 {
    fld1: Ok1;
    fld2: Ok2;
    fld3: Ok1?;
    fld4: Ok2?;
    init() {
        self.fld1 = Ok1{a: 1};
        self.fld2 = Ok2{ x: Ok1{a:2} };
        self.fld3 = null;
        self.fld4 = null;
    }
}
