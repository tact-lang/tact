struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: Int?;
    d: String?;
}

struct BigStruct {
    first: Inner1;
    second: Inner2;
}

contract AssignBigStructTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            first: Inner1{a:10,b:true},
            second: Inner2{c:null,d:"hello"}
        };
    }
}