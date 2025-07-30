struct A {
    x: Int;
    y: Bool;
    z: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract TestContract {
    complexField: A;

    init() {
        self.complexField = A{
            x: 12,
            y: false,
            z: "hello",
            optInt: null,
            optBool: true,
            optString: null
        };
    }
}