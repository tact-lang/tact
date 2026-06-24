struct Combo1 {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract PermutationTest {
    val: Combo1;

    init() {
        self.val = Combo1{
            a:1,
            b:null,
            c:"hello",
            d:null,
            e:true,
            f:null
        };
    }
}