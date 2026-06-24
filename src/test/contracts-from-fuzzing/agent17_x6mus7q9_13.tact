contract TestOperatorPrecedence {
    fun run() {
         let a: Int = -5;         // Expected: -5
         let b: Int = ~5;          // Expected: -6
         let c: Int = -(~5);       // Expected: 6
         let d: Int = ~(-5);       // Expected: 4
         let e: Int = 5 << 2;      // Expected: 20
         let f: Int = 4 >> 2;      // Expected: 1
         let g: Int = -4 >> 2;     // Expected: -1 (sign-propagating shift)
         dump(a);
         dump(b);
         dump(c);
         dump(d);
         dump(e);
         dump(f);
         dump(g);
    }
    receive() {
         self.run();
    }
}
