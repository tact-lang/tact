// Test snippet for conflicting persistent state variables in traits

trait TraitX {
    x: Int;
    fun getX(): Int {
        return self.x;
    }
}

trait TraitY {
    x: Int;
    fun doubleX(): Int {
        return self.x * 2;
    }
}

contract AmbiguousState(x: Int) with TraitX, TraitY {
    receive() {
        dump(self.getX() + self.doubleX());
    }
}
