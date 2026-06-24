struct Level1 {
    foo: Int;
    bar: Bool; 
    nested: Level2;
}

struct Level2 {
    val: Int; 
    opt: Int?;
}

contract CombinedStruct {
    s: Level1;
    init() {
        self.s = Level1{
            foo: 1,
            bar: false,
            nested: Level2{
                val: 2,
                opt: null
            }
        };
    }
    receive() {
        let _ = self.s.nested.val;
    }
}