struct LargeNestedOpt {
    n1: Int?; n2: Bool?; n3: String?;
    n4: Address?; n5: Cell?; n6: Slice?;
}

struct OutWrap {
    inner: LargeNestedOpt;
}

contract TestContract {
    d: OutWrap = OutWrap{
        inner: LargeNestedOpt{
            n1:null,n2:null,n3:null,n4:null,n5:null,n6:null
        }
    };
}