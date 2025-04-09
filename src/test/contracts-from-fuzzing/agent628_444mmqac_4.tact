struct Recursive1 {
    n: Int;
    o: Recursive2;
}

struct Recursive2 {
    m: String;
    p: Bool?;
}

contract VariedNested {
    val: Recursive1;

    init() {
        self.val = Recursive1{ n: 5, o: Recursive2{ m: "hi", p:true } };
    }
}