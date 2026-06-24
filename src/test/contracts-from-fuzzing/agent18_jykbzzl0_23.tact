contract Test {
    receive() {}
    
    // Getter calling itself recursively. This edge case tests recursive getter behavior.
    get fun rec(): Int {
         return self.rec();
    }
}
