trait T1 {
    virtual const X: Int = 1;
}

trait T2 {
    virtual const X: Int = 2;
}

contract D() with T1, T2 {
    // Override the conflicting virtual constant
    override const X: Int = 100;
    
    receive() {
        dump(self.X); // expected output: 100
        cashback(sender());
    }
    
    get fun getX(): Int {
        return self.X;
    }
}

fun main() {}
