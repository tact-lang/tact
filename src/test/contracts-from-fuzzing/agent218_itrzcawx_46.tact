struct RepeatedTypes {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract RepeatIntStruct {
    val: RepeatedTypes;

    init() {
        self.val = RepeatedTypes{
            a: 1,b:2,c:3,d:4
        };
    }
}