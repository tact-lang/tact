struct Mix {
    i: Int;
    s: String;
    b: Bool;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract MultiTypeStruct {
    val: Mix;

    init() {
        self.val = Mix{
            i:1, s:"hi", b:true, c:emptyCell(), sl:"x".asComment().asSlice(), a:myAddress()
        };
    }
}