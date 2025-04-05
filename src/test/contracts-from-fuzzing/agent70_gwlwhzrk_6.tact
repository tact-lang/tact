contract Test {
    owner: Int;
    init() {
         self.owner = 100; // initializing field
    }
    receive() {
         dump(self.owner); // field access expression
    }
}
