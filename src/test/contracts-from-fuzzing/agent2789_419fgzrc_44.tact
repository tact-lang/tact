struct JustBool {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolsStorageTest {
    j: JustBool;

    init() {
        self.j=JustBool{
            a:true,
            b:false,
            c:true
        };
    }
}