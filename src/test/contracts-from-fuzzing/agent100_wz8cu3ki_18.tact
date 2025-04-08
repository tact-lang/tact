struct Complex {
    s1: Int; 
    s2: Int as uint32;
    s3: Int?; 
    s4: String; 
    s5: Bool; 
    s6: Cell;
    s7: Address;
}

contract Test19 {
    val: Complex;

    init() {
        self.val = Complex{
            s1: 1,
            s2: 2,
            s3: null,
            s4: "abc",
            s5: true,
            s6: emptyCell(),
            s7: myAddress()
        };
    }
}