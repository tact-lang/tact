struct UniformTypes {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract BulkSameTypes {
    val: UniformTypes;
    init() {
        self.val = UniformTypes{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}
