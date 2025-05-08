// Struct with many primitive fields, contract persistent default null (explicitly) optionals
struct Data {
    a:Int; b:Int; c:Int;
    d:Int; e:Int; f:Int;
    g:Int; h:Int; i:Int;
}

contract ManyOptStruct {
    val: Data?;

    init() {
        self.val = null;
    }
}