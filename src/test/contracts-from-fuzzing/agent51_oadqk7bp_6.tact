contract Test1 {
    const MY_CONSTANT: Int = 42;

    get fun test() : Int {
         return self.MY_CONSTANT;
    }
}
