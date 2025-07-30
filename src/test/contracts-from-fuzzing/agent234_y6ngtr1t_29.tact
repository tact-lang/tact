// Struct with many optionals + serialization on some
struct OptSer {
    a: Int?;
    b: Int? as uint32;
    c: String?;
    d: Bool?;
    e: Int;
    f: Int as int16;
}

contract OptSerTest {
    data: OptSer;

    init() {
        self.data = OptSer{
            a:null,b:null,c:null,d:null,e:5,f:6
        };
    }
}