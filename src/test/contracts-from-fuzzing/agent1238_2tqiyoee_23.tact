struct DuplicateTypes {
    a: Int;
    b: Int;
    c: String;
    d: String;
    e: Bool;
    f: Bool;
}

contract SameTypesTest {
    d: DuplicateTypes;

    init() {
        self.d = DuplicateTypes{
            a:1,b:2,c:"c",d:"d",e:true,f:false
        };
    }
}