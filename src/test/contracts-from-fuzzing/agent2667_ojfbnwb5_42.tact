struct IntBoolOptDefaults {
    a: Int? = null;
    b: Bool = false;
    c: Int = 0;
}

contract IntBoolOptContract {
    data: IntBoolOptDefaults;

    init() {
        self.data = IntBoolOptDefaults{};
    }

    receive() {
        self.data = IntBoolOptDefaults{a:5,b:true,c:100};
    }
}