struct FieldOrderTest {
    first: Int as int8;
    second: Int as uint32;
    third: Bool;
    fourth: String;
    fifth: Bool?;
}

contract OrderedFields {
    st: FieldOrderTest;
    init() {
        self.st = FieldOrderTest{
            first:1, second:2, third:true, fourth:"x", fifth:null
        };
    }
}