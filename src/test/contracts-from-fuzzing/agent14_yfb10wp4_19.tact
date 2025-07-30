contract TestTernary {
    receive() {
         // Simple ternary expressions
         dump(true ? 100 : 200);
         dump(false ? 1 : 2);
         // Nested ternary (alternative case nesting without extra parentheses is allowed)
         dump(false ? 3 : true ? 4 : 5);
         
         // Nested ternary with explicit grouping for consequence
         dump(true ? (false ? 6 : 7) : 8);
    }
}
