struct A {
    n: Int;
    b: Bool;
    s: String;
    a2: Int;
    b2: Bool;
    s2: String;
    a3: Int;
    b3: Bool;
    s3: String;
}

contract TestContract {
    bigStruct: A;
    
    init() {
        self.bigStruct = A{
            n: 1,
            b: true,
            s: "a",
            a2: 2,
            b2: false,
            s2: "b",
            a3: 3,
            b3: true,
            s3: "c",
        };
    }
}