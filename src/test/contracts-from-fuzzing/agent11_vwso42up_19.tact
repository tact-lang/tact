contract IfElseGetter {
    x: Int = 7;
    y: Int = 9;
    
    receive() {}
    
    // Getter using if-else expression
    get fun max_value(): Int {
        if (self.x > self.y) {
            return self.x;
        } else {
            return self.y;
        }
    }
}
