struct InnerString {
    text: String;
}

struct OuterOpt {
    inner: InnerString?;
}

contract StructOptStruct {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{inner: null};
    }
}