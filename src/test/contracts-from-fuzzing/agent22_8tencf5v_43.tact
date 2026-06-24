// Persistent variable with struct of all 3 primitive types, with optionals variants
struct Primitives {
    i: Int;
    b: Bool;
    s: String;
}

struct OptPrimitives {
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract PrimOptionals {
    a: Primitives;
    b: OptPrimitives;

    init() {
        self.a = Primitives{i:1,b:true,s:"s"};
        self.b = OptPrimitives{oi:null,ob:null,os:null};
    }
}