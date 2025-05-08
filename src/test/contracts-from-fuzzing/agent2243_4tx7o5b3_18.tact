struct A {
    val: Int?;
}

contract OptionalStructField {
    state: A;

    init() {
        self.state = A{val:null};
    }
}
