contract TestDiscard {
    var: Int = 0;
    receive(_ : String) {
         self.var = 42;
    }
}
