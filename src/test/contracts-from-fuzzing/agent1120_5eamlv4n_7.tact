struct Blob {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
}

contract ManyTypes {
    data: Blob;

    init() {
        self.data = Blob{
            f1: 1,
            f2: true,
            f3: null,
            f4: null,
            f5: "hello",
            f6: null,
        };
    }
}