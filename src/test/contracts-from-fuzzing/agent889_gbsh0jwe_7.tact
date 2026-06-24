struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
}

contract MultiTypeFields {
    s: S;

    init() {
        self.s = S{
            a:1,b:true,c:"hello",d:emptyCell().asSlice(),e:myAddress(),
        };
    }
}