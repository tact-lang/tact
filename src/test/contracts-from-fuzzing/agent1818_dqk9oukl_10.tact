struct DuplicateTypes {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
}

contract DuplicateTest {
    data: DuplicateTypes;

    init() {
        self.data = DuplicateTypes{
            a:1, b:2, c:true, d:false, e:"abc", f:"def"
        };
    }
}
