struct MixTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract TestContract {
    mt: MixTypes;
    init() {
        self.mt = MixTypes{
            a:11,b:true,c:"abc",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice()
        };
    }
}