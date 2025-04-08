struct A {
    val: Int?;
}

contract AssignStructOpt {
    field: A;

    init() {
        self.field = A{val:null};
        self.field = A{val:10};
        self.field = A{val:null};
    }
}