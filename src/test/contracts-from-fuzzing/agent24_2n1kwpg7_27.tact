contract TestValidNestedTernary {
    receive() {
         // Valid nested ternary operator:
         // According to Tact grammar, this should be parsed as: false ? 1 : (false ? 2 : 3)
         let r: Int = false ? 1 : false ? 2 : 3; // expected result: 3
    }
}
