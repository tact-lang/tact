struct Pair { first: Int; second: Bool }

contract TupleReturnTest {
    fun produce(x: Int): Pair {
         if(x > 10) {
           return Pair { first: x, second: true };
         } else {
           return Pair { first: x, second: false };
         }
    }
}
