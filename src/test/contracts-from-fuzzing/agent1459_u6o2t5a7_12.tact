struct MixedDefaults {
    a: Int = 5;
    b: Int;         
    c: String = "x";
    d: Bool;        
}

contract StructSomeDefaults {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{
            a: 7, 
            b: 8,
            c: "x", 
            d: false
        };
    }
}
