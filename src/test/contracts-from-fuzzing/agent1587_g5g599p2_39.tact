struct Optional1 { a: Int?; }
struct Optional2 { b: Int?; }
struct Optional3 { c: Int?; }

contract LayeredOptionals {
    o1: Optional1?;
    o2: Optional2?;
    o3: Optional3?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
    }
}