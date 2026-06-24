struct Defaults {
    a: Int = 3;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: String?;
}

contract DefaultedStructs {
    s: Defaults;

    init() {
        self.s = Defaults{ a:5, b:true, c:"bye", d:null, e:null };
    }
}