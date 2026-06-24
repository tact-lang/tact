struct Inner1 { a: Int; b: Bool; }
struct Inner2 { x: Int?; y: String; }

struct Complex {
    s1: Inner1;
    s2: Inner2;
    optionalField: Int?;
    txt: String;
}

contract StructFieldVariants {
    val: Complex;

    init() {
        self.val = Complex{
            s1: Inner1{a:5, b:true},
            s2: Inner2{x:null, y:"hi"},
            optionalField: null,
            txt: "hello"
        };
    }
}