contract TestTernaryOperator {
    receive() {
         let x: Int = (10 > 5) ? 1 : 0;
         let y: String = false ? "Yes" : "No";
         dump(x);
         dump(y);
    }
}
