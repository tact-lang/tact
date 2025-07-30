contract TestTernary {
    receive() {
         // Ternary operator should choose expression based on condition
         dump(2 + 2 == 4 ? "correct" : "incorrect");
         dump(true ? 1 : 0);
         dump(false ? 100 : 200);
    }
}
