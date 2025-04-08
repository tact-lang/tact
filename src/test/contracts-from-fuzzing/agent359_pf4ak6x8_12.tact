struct OneField { x: Int }

struct ManyNesting {
    s1: OneField;
    s2: OneField;
    s3: OneField;
    s4: OneField;
    s5: OneField;
    s6: OneField;
    s7: OneField;
}

contract WideNesting {
    val: ManyNesting;
    init() {
        self.val = ManyNesting{
            s1: OneField{ x: 1 },
            s2: OneField{ x: 2 },
            s3: OneField{ x: 3 },
            s4: OneField{ x: 4 },
            s5: OneField{ x: 5 },
            s6: OneField{ x: 6 },
            s7: OneField{ x: 7 }
        };
    }
}