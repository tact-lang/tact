struct BigData {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract MultiInstance {
    s1: BigData;
    s2: BigData;

    init() {
        self.s1 = BigData{ foo:1, bar:true, baz:"hi" };
        self.s2 = BigData{ foo:2, bar:false, baz:"bye" };
    }
}