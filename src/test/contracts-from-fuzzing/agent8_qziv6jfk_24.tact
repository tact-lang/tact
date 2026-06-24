contract TestGetterRecursion {
    receive() {}

    // Recursive getter: calling itself recursively
    get fun rec(): Int {
        return self.rec() + 1;
    }
}
