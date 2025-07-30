trait CalcTrait {
    const A: Int = 10;
    virtual const B: Int = self.A + 5;
}

contract E() with CalcTrait {
    // Override the virtual constant B
    override const B: Int = 100;
    
    receive() {
        let res = self.A + self.B; // expected output: 10 + 100 = 110
        dump(res);
    }
}
