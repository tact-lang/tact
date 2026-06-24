struct WithStringOpt {
    val: Int;
    name: String?;
}

contract OptionalStringTest {
    data: WithStringOpt;
    init() {
        self.data = WithStringOpt{val:5, name:null};
    }
}