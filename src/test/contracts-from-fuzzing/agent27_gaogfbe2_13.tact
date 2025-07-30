struct Pair { a: Int; b: Int; }

contract TestDestruct {
    fun getPair(): Pair { 
         return Pair { a: 4, b: 6 };
    }
    receive() {
        let Pair { a, b } = self.getPair();
        dump(a + b); // Expect 10
    }
}
