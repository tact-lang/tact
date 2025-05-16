extends fun double(self: Int): Int {
    return self * 2;
}

trait MultiplyTrait {
    fun multiply(x: Int, y: Int): Int {
         return x.double() + y;
    }
}

contract TestMultiply() with MultiplyTrait {
    receive() {
         let result = self.multiply(3, 4); // expected: 3*2 + 4 = 10
         dump(result);
         cashback(sender());
    }
    
    get fun getResult(): Int {
         return self.multiply(5, 6); // expected: 5*2 + 6 = 16
    }
}

fun main() {}
