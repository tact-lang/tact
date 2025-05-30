asm fun customAdd(a: Int, b: Int): Int { ADD }

contract AAdd {
   fun run(): Int {
      return customAdd(3, 4); // Expected 7
   }
   
   receive() {
      let r: Int = self.run();
      cashback(sender());
   }
}
