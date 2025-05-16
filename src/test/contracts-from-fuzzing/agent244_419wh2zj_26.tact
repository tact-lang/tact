// very deep optional nested contract field
struct In6 { val: Int; }
struct In5 { in6: In6?; }
struct In4 { in5: In5?; }
struct In3 { in4: In4?; }
struct In2 { in3: In3?; }
struct In1 { in2: In2?; }

contract VeryDeepOptional {
    root: In1;

    init() {
        self.root = In1{
            in2: null
        };
    }
}