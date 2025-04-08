struct SingleOptional {
    x: Int?;
}

contract SingleOptTest {
    s: SingleOptional;
    init() {
        self.s = SingleOptional{x:null};
    }
}