struct NullableInts {
    a:Int?;
    b:Int?;
    c:Int?;
}

contract OptGroup {
    data: NullableInts;

    init() {
        self.data = NullableInts{ a:null, b:null, c:null };
    }
}
