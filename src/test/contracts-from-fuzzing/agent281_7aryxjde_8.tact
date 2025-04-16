struct Mid {
    a: Int;   b: Bool;  c: String;
    d: Address; e: Cell;  f: Slice;
}

struct Top {
    first: Mid;
    second: Mid;
    third: Mid;
}

contract TestMultiNested {
    payload: Top;

    init() {
        self.payload = Top{
            first: Mid{
                a:0,b:false,c:"",
                d:myAddress(), e:emptyCell(), f:emptyCell().asSlice()},
            second: Mid{
                a:1,b:true,c:"hi",
                d:myAddress(), e:emptyCell(), f:emptyCell().asSlice()},
            third: Mid{
                a:2,b:false,c:"yo",
                d:myAddress(), e:emptyCell(), f:emptyCell().asSlice()}
        };
    }
}