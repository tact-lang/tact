struct A { b: Int as uint8 }
struct B { c: Int as uint16 }
struct C { d: Int as uint32 }

contract SerialFormats {
    a: A; b: B; c: C;
    init(){
        self.a = A{b:255};
        self.b = B{c:65535};
        self.c = C{d:4294967295};
    }
}