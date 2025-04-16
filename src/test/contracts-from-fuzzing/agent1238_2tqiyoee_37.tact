struct ABC {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyStructVarsTest {
    s1: ABC;
    s2: ABC;

    init() {
        self.s1 = ABC{a:1,b:true,c:"s1"};
        self.s2 = ABC{a:2,b:false,c:"s2"};
    }
}