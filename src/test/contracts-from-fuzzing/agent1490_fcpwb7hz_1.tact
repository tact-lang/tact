struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestStorage {
    innerField: Inner;
    
    init() {
        self.innerField = Inner{
            a: 1,
            b: true,
            c: "test"
        };
    }
}