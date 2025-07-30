trait OptionalT {
    // Abstract function returning an optional Int
    abstract fun compute(): Int?;
}

contract OptionalC(x: Int) with OptionalT {
    // Override compute: return x if positive, else null
    override fun compute(): Int? { 
         return (self.x > 0) ? self.x : null;
    }

    receive() {
         let r: Int? = self.compute();
         if (r != null) {
             dump(r!!);
         } else {
             dump(0);
         }
         cashback(sender());
    }
}
