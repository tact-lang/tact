struct DrResults {
    a: Int;
    b: Int;
    mod1: Int;
    mod2: Int;
}

contract TestDivRounding() {
    // Test division rounding:
    // 3/2 should be 1, because integer division rounds down toward -∞
    // -3/2 should be -2
    const a: Int = 3 / 2;    
    const b: Int = -3 / 2;

    // Test modulo operator behavior:
    // 1 % 5 should be 1, and 1 % -5 should be -4 as per documentation
    const mod1: Int = 1 % 5;
    const mod2: Int = 1 % -5;

    // Getter to expose these constant values
    // Since tuple return types are not allowed, we use a struct
    get fun getResults() : DrResults {
         return DrResults{ a: self.a, b: self.b, mod1: self.mod1, mod2: self.mod2 };
    }

    receive() {
         cashback(sender());
    }
}
