extends fun triple(self: Int): Int {
    return self * 3;
}

trait TripleTrait {
    fun applyTriple(x: Int): Int {
         return x.triple();
    }
}

contract TestTriple() with TripleTrait {
    receive() {
         let t = self.applyTriple(5); // expected 15
         dump(t);
         cashback(sender());
    }
    
    get fun resTriple(): Int {
         return self.applyTriple(7); // expected 21
    }
}

fun main() {}
