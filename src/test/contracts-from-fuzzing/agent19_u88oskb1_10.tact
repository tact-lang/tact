struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
}

contract Test {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{a:5,b:true,c:"abc"};
    }
}