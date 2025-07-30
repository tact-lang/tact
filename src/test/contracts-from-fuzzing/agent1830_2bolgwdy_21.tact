struct MultipleBoolString {
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
}

contract TestContract {
    data: MultipleBoolString;

    init() {
        self.data = MultipleBoolString{
            b1:true,
            b2:false,
            s1:"test1",
            s2:"test2"
        };
    }
}
