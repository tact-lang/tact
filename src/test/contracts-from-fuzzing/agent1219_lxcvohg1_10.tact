// Large struct with optional and nested fields, default values
struct Mega {
    a: Int;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    e: String;
    f: Address;
    g: Int? = null;
}

struct OuterMega {
    x: Mega;
    y: Mega?;
    z: Int = 999;
}

contract TestMega {
    storage: OuterMega;

    init() {
        self.storage = OuterMega{
            x: Mega{
                a:1, b:false, c:null, d:null, e:"e", f:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"), g:null
            },
            y: null,
            z:1234
        };
    }
}