struct Pair { a: Int; b: Int }

contract Test {
    fun getPair(): Pair {
      return Pair{ a: 1, b: 2 };
    }

    fun usePair(): Int {
      let p: Pair = self.getPair();
      return p.a + p.b;
    }
}
