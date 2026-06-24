struct MultipleOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Bool?;
}

contract TestContract {
    val: MultipleOptional;

    init() {
        self.val = MultipleOptional{ a:null, b:1, c:null, d:"x", e:true };
    }
}