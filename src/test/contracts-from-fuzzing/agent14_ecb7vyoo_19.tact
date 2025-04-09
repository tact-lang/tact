contract TestStringBuilderAndUnary {
    receive() {
         // Test StringBuilder concatenation using concat() extension
         let sb: StringBuilder = beginString();
         sb = sb.concat("Hello, ").concat("world!");
         dump(sb.toString());

         // Test unary operators, double negation and double inversion
         dump(!(!true));
         dump(-(-42));
    }
}
