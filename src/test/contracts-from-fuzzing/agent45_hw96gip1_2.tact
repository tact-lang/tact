contract Test {
    value: Int = 123;

    receive () {}

    get fun getValue(): Int {
         return self.value;
    }
}
