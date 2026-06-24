struct MultiNested {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int;
    y: Deeper;
}

struct Deeper {
    flag: Bool;
    str: String;
    slice: Slice;
}

contract Test {
    st: MultiNested;
    init() {
        self.st = MultiNested{
            a:1,
            b:Inner{
                x:2,
                y:Deeper{
                    flag:true,
                    str:"hello",
                    slice:emptyCell().asSlice()
                }
            }
        };
    }
}