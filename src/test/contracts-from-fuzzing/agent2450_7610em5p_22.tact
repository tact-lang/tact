// Wide persistent state, solely nullable primitives
contract FlatManyNullables {
    a: Int?; b: Int?; c: Bool?; d: Bool?; e: String?;
    f: String?; g: Address?; h: Address?; i: Cell?;
    j: Cell?; k: Slice?; l: Slice?;
    
    init() {
        self.a=null; self.b=null; self.c=null; self.d=null; self.e=null;
        self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
        self.k=null; self.l=null;
    }
}
