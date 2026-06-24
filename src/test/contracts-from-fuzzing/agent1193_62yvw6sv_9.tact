struct S1 { n: Int; txt: String; }
struct S2 { flg: Bool; inner: S1; addr: Address; }
struct S3 { inner2: S2; sliceVal: Slice; cellVal: Cell; }

contract MultiLevelContract {
    data: S3;

    init() {
        self.data = S3{
            inner2: S2{
                flg:true, inner:S1{n:0, txt:""}, addr:myAddress()
            },
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
        };
    }
}