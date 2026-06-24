struct Tiny {
    a: Int;
    b: Bool;
}

contract ManyTinyFields {
    t1: Tiny; t2: Tiny; t3: Tiny; t4: Tiny; t5: Tiny;
    t6: Tiny; t7: Tiny; t8: Tiny; t9: Tiny; t10: Tiny;
    t11: Tiny; t12: Tiny; t13: Tiny; t14: Tiny; t15: Tiny;
    
    init() {
        let def = Tiny{ a:1, b:true };
        self.t1=def; self.t2=def; self.t3=def; self.t4=def; self.t5=def;
        self.t6=def; self.t7=def; self.t8=def; self.t9=def; self.t10=def;
        self.t11=def; self.t12=def; self.t13=def; self.t14=def; self.t15=def;
    }
}