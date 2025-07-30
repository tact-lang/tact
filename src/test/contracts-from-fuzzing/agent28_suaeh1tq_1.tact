struct MyPair {
  a: Int;
  b: Int;
}

contract Test {
   receive() {
       let pair = MyPair{ a: 1, b: 2 };
       // Ensuring that it compiles and that the type is recognized.
   }
}
