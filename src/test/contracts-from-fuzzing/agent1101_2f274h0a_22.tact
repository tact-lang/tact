struct S {
    a: Int;  
    b: Bool; 
    c: String;
}

contract DefaultsInStruct {
    val: S = S{ a:42, b:true, c:"hi" };

    init() {
        self.val = S{ a:5, b:false, c:"x" };
    }
}