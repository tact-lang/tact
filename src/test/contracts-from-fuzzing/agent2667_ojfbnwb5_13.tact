struct MultipleBoolInt {
    a: Bool; b: Int;
    c: Bool; d: Int;
    e: Bool; f: Int;
}

contract MixedFieldsContract {
    storage: MultipleBoolInt;
    
    init() {
        self.storage = MultipleBoolInt{
            a: true, b: 1,
            c: false, d: 2,
            e: true, f: 3
        };
    }
    
    receive() {
        self.storage = MultipleBoolInt{
            a: false, b: 4,
            c: true, d: 5,
            e: false, f: 6
        };
    }
}