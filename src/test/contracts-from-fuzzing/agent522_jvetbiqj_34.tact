struct Recurse1 {
    val: Int;
}

struct Recurse2 {
    nest: Recurse1?;
}

struct Recurse3 {
    rec: Recurse2?;
}

contract MultipleOptionalsChain {
    data: Recurse3?;

    init() {
        self.data = null;
    }
}