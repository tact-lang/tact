struct LargeNested {
    one: Int; two: Bool; three: String; four: Int?;
    five: String?; six: Bool?; seven: Cell; eight: Slice;
    nine: Address; ten: Int; eleven: Bool; twelve: String;
    nest1: Inner;
}

struct Inner {
    ia: Int;
    ib: Bool?;
    ic: String?;
    id: Cell;
}

contract BigNest {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            one:1,two:true,three:"a",four:null,
            five:"b",six:false,seven:emptyCell(),eight:emptyCell().asSlice(),
            nine:myAddress(),ten:10,eleven:true,twelve:"x",
            nest1: Inner{ia:7, ib:true, ic:null, id:emptyCell()},
        };
    }
}