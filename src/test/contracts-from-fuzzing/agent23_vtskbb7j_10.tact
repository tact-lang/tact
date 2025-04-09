contract TestTernary {
    receive() {
         let a = true ? 42 : 0;         // ternary operator with boolean literal
         let b = (false ? 1 + 1 : 2 + 2); // nested arithmetic inside ternary
    }
}
