struct Wrapper {
    data: Int?;
}

contract Test {
    val: Wrapper;

    init() {
        self.val = Wrapper{data:null};
    }
}