struct WithDefaults {
    x: Int = 1;
    y: Int = 2;
    s: String = "hi";
    b: Bool = false;
    o: Int?;
}

contract StructWithDefaults {
    val: WithDefaults;
    init() {
        self.val = WithDefaults{ x:2, y:3, s:"hello", b:true, o:null };
    }
}