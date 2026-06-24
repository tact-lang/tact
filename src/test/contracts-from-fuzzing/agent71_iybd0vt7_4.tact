contract TestUnaryExpressions {
    receive() {
         // Unary minus: double negation should produce positive one
         let u1: Int = -(-1);
         // Bitwise NOT: ~42 should yield -43
         let i: Int = 42;
         let u2: Int = ~i;
         // Logical NOT: !true should yield false
         let b: Bool = !true;
         dump(u1);
         dump(u2);
         dump(b);
    }
}
