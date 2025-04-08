// contract with very many persistent fields of various optional types
contract ManyOptionals {
    a: Int?; b: String?; c: Bool?; d: Address?; e: Int?;
    f: String?; g: Bool?; h: Address?; i: Int?; j: String?;

    init() {
        self.a=null; self.b=null; self.c=null; self.d=null; self.e=null;
        self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
    }
}
