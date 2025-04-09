struct A { a: Int; } 
struct B { opt: A?; } 

contract NullInnerStruct {
    f: B;

    init() {
        self.f = B{ opt:null };
    }
}
