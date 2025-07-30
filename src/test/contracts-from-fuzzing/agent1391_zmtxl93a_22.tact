struct Wrapper {
    a: Int?;
    s: SubStruct;
}

struct SubStruct {
    b: Bool?;
    s: String;
}

contract WrapTest {
    field: Wrapper = Wrapper{
        a:null,
        s: SubStruct{ b:null, s: "hi" }
    };
}