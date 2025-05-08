// Struct with different primitive types, some optional
struct Mixed {
    a: Int;
    b: Bool;
    c: String?;
    d: Address?;
    e: Cell;
    f: Slice?;
}

contract MixedStructContract {
    val: Mixed;
    
    init() {
        self.val = Mixed{
            a:1, b:true, c:null, d:null, e:emptyCell(), f:null
        };
    }
}