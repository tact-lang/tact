struct EmptyDefaults {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
}

contract DefaultInitTest {
    data: EmptyDefaults;

    init() {
        self.data = EmptyDefaults{
            a:0, b:null, c:false, d:""
        };
    }
}