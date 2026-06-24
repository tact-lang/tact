struct DeepNested {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice;
}

struct Wrapper {
    x: DeepNested;
    y: DeepNested;
}

contract TestContract {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            x: DeepNested{a:1,b:null,c:"hi",d:emptyCell().asSlice()},
            y: DeepNested{a:2,b:true,c:"bye",d:emptyCell().asSlice()}
        };
    }
}