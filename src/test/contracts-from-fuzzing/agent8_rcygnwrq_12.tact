contract Test {
    receive() {
         // Test concatenation via StringBuilder
         let builder: StringBuilder = beginString();
         builder.append("Hello");
         builder.append(", world!");
         let s: String = builder.toString();
    }
}
