struct Complex { calc: Int }

contract TestStructInit {
    receive() {
         // Test arithmetic inside struct field initialization
         let s: Complex = Complex { calc: 2 + 3 * 4 }; // expected: 2 + (3*4) = 14
         dump(s.calc);
    }
}
