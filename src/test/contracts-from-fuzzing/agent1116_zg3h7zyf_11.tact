struct BigStruct {
    a0: Int;  a1: Int;  a2: Int;  a3: Int;  a4: Int;
    a5: Bool; a6: Bool; a7: Bool; a8: Bool; a9: Bool;
    s0: String; s1: String; s2: String; s3: String; s4: String;
    f0: Int;  f1: Int;  f2: Int;  f3: Int;  f4: Int;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a0: 0, a1: 1, a2: 2, a3: 3, a4:4,
            a5: true, a6: false, a7: true, a8: false, a9: true,
            s0: "a", s1: "b", s2: "c", s3: "d", s4: "e",
            f0: 10, f1: 11, f2: 12, f3: 13, f4:14
        };
    }
}