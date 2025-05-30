contract ConstantsAndFields {
    const C1: Int = 42;
    const C2: String = "forty-two";

    a: Int = 5;
    b: String = "hi";

    get fun getSum(): Int {
        return self.a + self.C1;
    }
}