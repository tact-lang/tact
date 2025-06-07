struct Wrap {
    val: Int?;
}

contract AssignNullOpt {
    data: Wrap;

    init() {
        self.data = Wrap{val:null};
    }
}