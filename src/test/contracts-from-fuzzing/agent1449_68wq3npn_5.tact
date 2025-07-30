struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Address?;
    f: String?;
    g: Inner2?;
}

struct Inner2 {
    x: Int;
    y: String?;
}

contract NestedStructOptional {
    val: Inner = Inner{
        a:0, b:true, c:"A", d:null, e:null, f:null, g:null
    };
    
    init() {
        self.val = Inner{
            a:1, b:false, c:"B", d:42, e:myAddress(), f:"hi", g:Inner2{ x:5, y:"test" }
        };
    }
}
