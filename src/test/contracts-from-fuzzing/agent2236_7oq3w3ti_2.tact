struct Inner {
    a: Int;
    b: Bool;
    
    c: String;
}

struct Outer {
    x: Int;
    y: Inner; 
    z: Bool?;
}

contract ComplexNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: 10,
            y: Inner{ a: 1, b: false, c: "hi" },
            z: null
        };
    }
}