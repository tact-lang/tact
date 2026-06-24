struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: String?;
    nested: Nested;
}

struct Nested {
    x: Int; 
    y: Bool = true; 
    z: String = "ok";
}

contract MixedFields {
    storage: BigStruct;

    init() {
        self.storage = BigStruct{
            a: 55,
            b: false,
            c: "hello",
            d: null,
            e: "nullable",
            nested: Nested{
                x: 99
            },
        };
    }
}