struct Pair { first: Int; second: Int }

contract TestPairReturn {
   fun getPair(x: Int): Pair {
       if (x > 0) {
           return Pair { first: x, second: x * 2 };
       } else {
           return Pair { first: 0, second: 0 };
       }
   }
   
   receive () {}
}

contract TestReceiveReturn {
   receive () { return; }
}

contract TestRepeatReturn {
    fun testRepeat(nums: Int): Int {
       let sum: Int = 0;
       repeat (5) {
         if (nums > 0) {
            return nums;
         }
         sum += 1;
       }
       return sum;
    }
    receive() {}
}
