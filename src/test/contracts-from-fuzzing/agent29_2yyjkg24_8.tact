trait TraitX {
    x: Int;
    fun getX(): Int { return self.x; }
}

trait TraitY {
    x: Int;
    fun getX2(): Int { return self.x; }
}

// Using contract parameters to declare persistent state variable "x"
contract TestXY(x: Int) with TraitX, TraitY {
    // No init() function, because x is provided as a contract parameter

    receive() {
        dump(self.x);
        cashback(sender());
    }
}
