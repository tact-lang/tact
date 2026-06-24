struct Data {
    a: Int?;
    b: Bool?;
    c: Int;
    d: Bool;
}

contract MixedOptional {
    val: Data;

    init() {
        self.val = Data{ a:null, b:true, c:1, d:false };
    }
}