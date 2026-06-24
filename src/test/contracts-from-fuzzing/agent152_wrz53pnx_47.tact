struct OuterWithRemain1 {
    innerVal: Int;
    extra: Slice as remaining;
}

struct OuterWithRemain2 {
    inner: OuterWithRemain1;
    val2: Int;
}

contract RemainingNested {
    data: OuterWithRemain2;

    init() {
        self.data = OuterWithRemain2{
            inner: OuterWithRemain1{innerVal:1, extra:emptyCell().asSlice()}, val2:42
        };
    }
}