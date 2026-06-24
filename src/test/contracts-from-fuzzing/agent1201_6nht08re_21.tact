struct Complex {
    a: Int;
    b: Bool;
    c: Nested1;
}

struct Nested1 {
    x: Int?;
    y: Bool?;
    z: Inner;
}

struct Inner {
    foo: String;
    bar: Address;
}

contract FieldsComplex {
    val: Complex;

    init() {
        self.val = Complex{
            a:42,
            b:true,
            c:Nested1{
                x:null,
                y:null,
                z:Inner{foo:"hi", bar:myAddress()}
            }
        };
    }
}