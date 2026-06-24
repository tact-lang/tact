contract RecursiveGetter {
    receive() {}
    
    // This getter calls itself recursively. While it compiles, executing it will likely lead to a stack overflow at runtime.
    get fun rec(): Int {
        return self.rec();
    }
}
